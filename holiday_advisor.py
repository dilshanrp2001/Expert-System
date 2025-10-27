import streamlit as st
from pyswip import Prolog
import json

# ==============================================================================
# 1. PROLOG ENGINE INITIALIZATION
# ==============================================================================

try:
    prolog = Prolog()
    prolog.consult("knowledge_base_holidays.pl") 
except Exception as e:
    st.error(f"Error initializing Prolog or loading knowledge_base_holidays_confidence_free.pl:")
    st.error(f"Details: {e}")
    st.error("Please ensure SWI-Prolog is installed correctly and the .pl file is in the same directory.")
    st.stop()


# ==============================================================================
# 2. STREAMLIT USER INTERFACE
# ==============================================================================

st.set_page_config(page_title="Holiday Advisor", page_icon="🏖️", layout="wide")
st.title("🏖️ Holiday Destination Advisor")
st.write("Answer a few quick questions to get a set of personalized travel recommendations.")

# This dictionary will hold all the answers
requirements = {}

# We use columns for a cleaner layout
col1, col2 = st.columns(2)

with col1:
    st.subheader("Travel Preferences")
    
    # Q1: Destination Type
    type_map = {
        "Skip": None,
        "Beach": "beach",
        "City": "city",
        "Nature": "nature",
    }
    type_choice = st.selectbox("What kind of location do you prefer?", list(type_map.keys()), key='destination_type_selectbox_key')
    requirements['destination_type'] = type_map[type_choice]
    
    # Q2: Main Activity
    activity_map = {
        "Skip": None,
        "Relaxation": "relaxation",
        "Adventure/Sports": "adventure",
        "Culture/History": "culture",
        "Partying/Nightlife": "partying" 
    }
    activity_choice = st.selectbox("What is the main activity you're looking for?", list(activity_map.keys()))
    requirements['activity'] = activity_map[activity_choice]

    # Q3: Budget
    budget_map = {
        "Skip": None,
        "Low": "low",
        "Medium": "medium",
        "High": "high",
        "Very High/Exclusive": "very_high"
    }
    budget_choice = st.selectbox("What is your expected trip budget (excl. flights)?", list(budget_map.keys()))
    requirements['budget'] = budget_map[budget_choice]

with col2:
    st.subheader("Timing & Style")

    # Q4: Travel Season
    season_map = {
        "Skip": None,
        "Summer": "summer",
        "Winter": "winter",
        "Spring/Autumn": "spring_autumn",
        "Year-Round": "year_round"
    }
    season_choice = st.selectbox("When are you planning to travel?", list(season_map.keys()))
    requirements['season'] = season_map[season_choice]
    
    # Q5: Travel Style
    style_map = {
        "Skip": None,
        "Family": "family",
        "Solo": "solo",
        "Romantic": "romance",
        "Group": "group"
    }
    style_choice = st.selectbox("What's the overall tone or style of the trip?", list(style_map.keys()))
    requirements['travel_style'] = style_map[style_choice]

# --- "Get Recommendation" Button ---
if st.button("Find My Dream Destination", type="primary", use_container_width=True):
    
    # Filter out 'None' values
    final_requirements = {k: v for k, v in requirements.items() if v is not None}
    
    # --- Show a summary of the facts sent to the engine ---
    with st.expander("See all collected requirements (facts)"):
        st.json(final_requirements)
        
    # --- Run the Expert System (pyswip logic) ---
    try:
        # 1. Cleanup old facts
        prolog.retractall("requirement(_,_)")
        
        # 2. Assert all new facts
        for key, value in final_requirements.items():
            fact_string = f"requirement({key}, {value})"
            prolog.assertz(fact_string)
        
        # 3. Query for ALL recommendations (no confidence queried)
        query_string = "recommend_holiday(destination: D, reason: R)"
        raw_results = list(prolog.query(query_string))

        # 4. Cleanup facts immediately
        prolog.retractall("requirement(_,_)")
        
        # 5. Process results into a clean list of dictionaries
        recommendations = []
        if raw_results:
            for r in raw_results:
                recommendations.append({
                    'destination': r['D'],
                    'reason': r['R']
                })
        
        st.divider()
        
        # --- Display the results ---
        if not recommendations:
            st.error("😔 No specific destination matched all your criteria. Try loosening a constraint.")
            st.info("""
            **Consider these popular choices:**
            * **Beach:** Bali
            * **City:** London
            * **Adventure:** Costa Rica
            """)
        else:
            
            st.header("✨ Matching Destinations")
            st.write(f"Based on your inputs, the system found **{len(recommendations)}** possible destinations. They are listed below in the order they were matched by the expert rules.")
            
            # --- Prepare and show download button ---
            output_data = {
                'requirements': final_requirements,
                'recommendations': recommendations # All matches listed equally
            }
            st.download_button(
                label="Download Full Report (JSON)",
                data=json.dumps(output_data, indent=2),
                file_name="holiday_recommendations.json",
                mime="application/json"
            )

            # --- Display all matched recommendations in simple tabs ---
            tab_titles = [rec['destination'].replace('_', ' ').title() for rec in recommendations]
            tabs = st.tabs(tab_titles)
            
            for tab, rec in zip(tabs, recommendations):
                with tab:
                    dest_name = rec.get('destination', 'N/A').replace('_', ' ').title()
                    st.subheader(f"Destination: {dest_name}")
                    
                    st.info(f"✨ **Why this works:** {rec.get('reason', 'N/A')}")

    except Exception as e:
        st.error(f"An error occurred during Prolog query: {e}")
        prolog.retractall("requirement(_,_)")