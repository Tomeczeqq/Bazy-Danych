-- funkcja Bilocation(@StudentID) która bierze jeden argument i zwraca kolidujące zajęcia dla podanego studenta
CREATE FUNCTION dbo.Bilocation
(
    @StudentID int
)
RETURNS TABLE
AS
RETURN (
    WITH modulesWithDetails AS (
        SELECT E.EventID, M.BeginDate, M.EndDate, M.ModuleID
        FROM students S
        JOIN event_students ES ON ES.StudentID = S.StudentID
        JOIN events E ON E.EventID = ES.EventID
        JOIN modules M ON M.EventID = E.EventID
        WHERE S.StudentID = @StudentID
    )
    SELECT 
        m1.EventID AS EventID1,
        m1.ModuleID AS ModuleID1, 
        m1.BeginDate AS BeginDate1, 
        m1.EndDate AS EndDate1, 
        m2.EventID AS EventID2,
        m2.ModuleID AS ModuleID2, 
        m2.BeginDate AS BeginDate2, 
        m2.EndDate AS EndDate2
    FROM modulesWithDetails m1
    JOIN modulesWithDetails m2 ON m1.ModuleID > m2.ModuleID
    WHERE m1.BeginDate <= m2.EndDate
    AND m1.EndDate >= m2.BeginDate
)

-- trigger InsertToModules, który w momencie dodawania modułu, dodaje wykładowce z eventem do event_lecturers, aby wszystko było spójne ze sobą
CREATE TRIGGER InsertToModules
ON modules
INSTEAD OF INSERT
AS
BEGIN

    INSERT INTO event_lecturers (EventID, LecturerID, Description)
    SELECT I.EventID, I.LecturerID, I.Description
    FROM INSERTED I
    LEFT JOIN event_lecturers EL ON I.EventID = EL.EventID AND I.LecturerID = EL.LecturerID
    WHERE EL.EventID IS NULL AND EL.LecturerID IS NULL;

    INSERT INTO modules (EventID, ModuleNo, LecturerID, LanguageID, TranslatorID, Description, BeginDate, EndDate, Capacity, RoomID, ModulePrice)
    SELECT I.EventID, I.ModuleNo, I.LecturerID, I.LanguageID, I.TranslatorID, I.Description, I.BeginDate, I.EndDate, I.Capacity, I.RoomID, I.ModulePrice
    FROM INSERTED I
END;