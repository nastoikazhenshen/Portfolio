**Data Cleaning**
- Removed duplicate records
- Standardized abbreviated categorical values (e.g., M to Married, S to Single, F to Female)
- Corrected inconsistencies in commute distance labels

**Feature Engineering**
- Created an Age Bracket column using a nested IF formula to classify customers as Adolescent, Middle Age, or Old
- Segmented commute distances into labeled ranges for readability

**Pivot Tables**

| Table | Dimensions | Metric |
|---|---|---|
| Average Income Per Purchase | Gender, Purchased Bike | Average Income |
| Customer Age Brackets | Age Bracket, Purchased Bike | Count of Purchases |
| Customer Commute | Commute Distance, Purchased Bike | Count of Purchases |

**Dashboard**
- Built interactive charts linked to pivot tables
- Added slicers for dynamic filtering by Marital Status, Region, and Education
  <img width="1511" height="958" alt="Screenshot_1299" src="https://github.com/user-attachments/assets/668f7c73-462a-4fb7-a74f-cd23fc159064" />


---

## File Structure

```
Excel Project Dataset.xlsx
    bike_buyers       — Raw and cleaned data
    Working Sheet     — Feature engineering
    Pivot Table       — Aggregated analysis
    Dashboard         — Interactive dashboard
```

---

## Skills Demonstrated

- Data cleaning and standardization
- Formula writing in Excel (IF, nested IF)
- Pivot table creation and configuration
- Data visualization using bar and line charts
- Dashboard design with interactive slicers
- Exploratory data analysis
