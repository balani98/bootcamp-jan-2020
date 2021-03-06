USE [practice]
GO

ALTER PROCEDURE [dbo].[proc_for_path_update] 
AS
BEGIN
DECLARE @Date varchar(30)
DECLARE @temppath varchar(100)
DECLARE @part1 varchar(50)
DECLARE @part2 varchar(50)
DECLARE @tempid int

--declaring CURSOR
DECLARE UpdateDate CURSOR
FOR
SELECT ID,Path FROM dbo.table_for_paths WHERE ID > 1
OPEN UpdateDate
FETCH Next from UpdateDate into @tempid, @temppath
WHILE (@@FETCH_STATUS = 0)
BEGIN
SET  @part1=SUBSTRING(@temppath,1,11)
SET  @part2=SUBSTRING(@temppath,23,12)
SET @temppath=@part1+@Date+@part2
FETCH Next from UpdateDate into @tempid, @temppath
END
CLOSE UpdateDate
DEALLOCATE UpdateDate
END
