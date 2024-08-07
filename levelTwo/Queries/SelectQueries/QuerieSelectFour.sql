-- שליפת גני הילדים הממוקמים באזור מסוים ושירותי ההסעדה שהם משתמשים בהם,
-- כולל רמת הכשרות:
-- מטרה: לעזור להורים לזהות גני ילדים שעונים על דרישות המיקום והדרישות התזונתיות הספציפיות עבור ילדיהם.

SELECT 
    d.Daycare_Name, -- שם גן הילדים
    c.Catering_Name, -- שם שירות ההסעדה
    c.Kashrut -- רמת הכשרות
FROM 
    Daycare d
JOIN 
    Catering c ON d.C_ID = c.C_ID -- הצטרפות לטבלת Catering לפי מזהה שירות ההסעדה
WHERE 
    d.Location = 123 -- סינון לפי מיקום גן הילדים (החלף 123 במיקום הספציפי הרצוי)
    AND c.C_ID IN (
        -- תת-שאילתה לבחירת גני הילדים הממוקמים באזור הספציפי
        SELECT 
            d.C_ID -- מזהה שירות ההסעדה
        FROM 
            Daycare d
        WHERE 
            d.Location = 123 -- סינון לפי מיקום גן הילדים (החלף 123 במיקום הספציפי הרצוי)
    );
