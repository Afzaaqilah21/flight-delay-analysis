# Flight delay and cancellation analysis

## Executive Summary
Using SQL and Power BI, I analyzed flight performance data to identify delay patterns across airlines, routes, and time periods. After cleaning the dataset and building an interactive dashboard, I found that the major factors contributing to delays include operational congestion, peak-hour scheduling, and certain high-traffic routes. Based on the analysis, I recommend a few actions that could help improve overall on-time performance:

1. Optimize flight schedules during peak traffic hours
2. Improve aircraft turnaround processes for busy routes

## Business Problem
Airline operations are heavily influenced by flight punctuality, as delays and cancellations can lead to increased costs, and dissatisfied passengers. Understanding patterns in flight delays and cancellations is critical for improving customer experience and minimizing operational losses. The primary challenge is to identify which flights, routes, or airlines are most prone to delays or cancellations and quantify the impact on overall performance. 

## Methodology
1. Clean and standardize flight data and prepare for analysis.
2. Identify key matrics such as delay duration, delay rate per hour, peak-hour indicators, and route congestion metrics.
3. Analyze trends and patterns in delays and cancellations by airline, route, day, and hour.
4. Build interactive dashboards to visualize delays, cancellation rates, and high-risk routes for easy decision-making.

## Key Metrics

1. Total Flights
2. Delayed Flights
3. Delay Rate (%)
4. Cancellation Rate (%)
5. Peak-Hour Congestion
6. High-Risk Routes

## Skills
- SQL: CTEs, Aggregate functions, CASE Statements, Date & Time Functions
- Power BI: DAX, Writing functions, ETL, Data visualisation, Data Modelling

## Result and Recommendation
The analysis identified peak hours and high-traffic routes with the highest delay and cancellation rates. Key metrics such as overall delay rate, route-specific delay rates, and cancellation percentages were calculated, revealing patterns like specific airlines or days of the week prone to higher disruptions. Interactive dashboards provided decision-makers with clear visualization of critical operational bottlenecks.

To reduce delays and cancellations, flight scheduling should be optimized during peak hours, and additional resources such as crew and gates should be allocated to high-traffic routes during congestion periods.

### How to Use
1. Clone the repository.
2. Load the flight dataset into Power BI or SQL environment.
3. Use provided SQL queries to clean, transform, and calculate key metrics.
4. Open the Power BI dashboard to explore interactive visuals.

