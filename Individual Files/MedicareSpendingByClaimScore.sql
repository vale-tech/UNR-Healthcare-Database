/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProviderId]
      ,[DataYear]
      ,[CTId_3_PNId_4_AvgSpendHosp]
      ,[CTId_6_PNId_2_AvgSpendHosp]
      ,[CTId_5_PNId_1_AvgSpendHosp]
      ,[CTId_4_PNId_2_AvgSpendHosp]
      ,[CTId_3_PNId_1_AvgSpendHosp]
      ,[CTId_3_PNId_2_AvgSpendHosp]
      ,[CTId_1_PNId_2_AvgSpendHosp]
      ,[CTId_7_PNId_4_AvgSpendHosp]
      ,[CTId_5_PNId_4_AvgSpendHosp]
      ,[CTId_7_PNId_1_AvgSpendHosp]
      ,[CTId_2_PNId_1_AvgSpendHosp]
      ,[CTId_8_PNId_3_AvgSpendHosp]
      ,[CTId_4_PNId_4_AvgSpendHosp]
      ,[CTId_2_PNId_4_AvgSpendHosp]
      ,[CTId_5_PNId_2_AvgSpendHosp]
      ,[CTId_4_PNId_1_AvgSpendHosp]
      ,[CTId_6_PNId_4_AvgSpendHosp]
      ,[CTId_1_PNId_4_AvgSpendHosp]
      ,[CTId_7_PNId_2_AvgSpendHosp]
      ,[CTId_6_PNId_1_AvgSpendHosp]
      ,[CTId_2_PNId_2_AvgSpendHosp]
      ,[CTId_1_PNId_1_AvgSpendHosp]
      ,[CTId_3_PNId_4_AvgSpendState]
      ,[CTId_6_PNId_2_AvgSpendState]
      ,[CTId_5_PNId_1_AvgSpendState]
      ,[CTId_4_PNId_2_AvgSpendState]
      ,[CTId_3_PNId_1_AvgSpendState]
      ,[CTId_3_PNId_2_AvgSpendState]
      ,[CTId_1_PNId_2_AvgSpendState]
      ,[CTId_7_PNId_4_AvgSpendState]
      ,[CTId_5_PNId_4_AvgSpendState]
      ,[CTId_7_PNId_1_AvgSpendState]
      ,[CTId_2_PNId_1_AvgSpendState]
      ,[CTId_8_PNId_3_AvgSpendState]
      ,[CTId_4_PNId_4_AvgSpendState]
      ,[CTId_2_PNId_4_AvgSpendState]
      ,[CTId_5_PNId_2_AvgSpendState]
      ,[CTId_4_PNId_1_AvgSpendState]
      ,[CTId_6_PNId_4_AvgSpendState]
      ,[CTId_1_PNId_4_AvgSpendState]
      ,[CTId_7_PNId_2_AvgSpendState]
      ,[CTId_6_PNId_1_AvgSpendState]
      ,[CTId_2_PNId_2_AvgSpendState]
      ,[CTId_1_PNId_1_AvgSpendState]
  FROM [UNRHealthcareData].[dbo].[vMedicareSpendingByClaimScorePivot]

  SELECT 'label var ' + SUBSTRING(LOWER('CTId_' + CAST(mis.[ClaimTypeId] as varchar)) + LOWER('_PNId_' + CAST(mis.[PeriodNameId] as varchar)) + '_avgspendhosp', 1, 32) + ' "' + SUBSTRING([ClaimType], 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicareSpendingByClaimScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[ClaimType] m on m.ClaimTypeId = mis.ClaimTypeId
INNER JOIN [UNRHealthcareData].[dbo].[PeriodName] p on p.PeriodNameId = mis.PeriodNameId
group by mis.[ClaimTypeId], [ClaimType], mis.PeriodNameId, PeriodName
UNION
SELECT 'label var ' + SUBSTRING(LOWER('CTId_' + CAST(mis.[ClaimTypeId] as varchar)) + LOWER('_PNId_' + CAST(mis.[PeriodNameId] as varchar)) + '_avgspendstate', 1, 32) + ' "' + SUBSTRING([ClaimType], 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicareSpendingByClaimScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[ClaimType] m on m.ClaimTypeId = mis.ClaimTypeId
INNER JOIN [UNRHealthcareData].[dbo].[PeriodName] p on p.PeriodNameId = mis.PeriodNameId
group by mis.[ClaimTypeId], [ClaimType], mis.PeriodNameId, PeriodName