DECLARE @AllVariables AS TABLE
(
 OutputRow varchar(max)
)

--INSERT INTO @AllVariables
--SELECT '* HospitalFactExtended'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER('FactId_' + CAST(mis.[FactDescriptionId] as varchar)) + '_value', 1, 32) + ' "' + SUBSTRING(FactDescription, 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HospitalFactExtended] mis
INNER JOIN [UNRHealthcareData].[dbo].[FactDescription] m on m.FactDescriptionId = mis.FactDescriptionId
group by mis.[FactDescriptionId], [FactDescription]

--INSERT INTO @AllVariables
--SELECT '* HospitalStructural'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_response', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HospitalStructural] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* ReadmissionReductionScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_numberofdischarges', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[ReadmissionReductionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_excessreadmissionratio', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[ReadmissionReductionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_predictedreadmissionrate', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[ReadmissionReductionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_expectedreadmissionrate', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[ReadmissionReductionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_numberofreadmissions', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[ReadmissionReductionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* TimelyEffectiveCareScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_score', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[TimelyEffectiveCareScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_sample', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[TimelyEffectiveCareScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* MedicalImagingScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_score', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicalImagingScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_sample', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicalImagingScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* MedicareSpendingPerBeneficiaryScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_score', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicareSpendingPerBeneficiaryScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* PaymentScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_payment', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[PaymentScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_lowerestimate', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[PaymentScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_higherestimate', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[PaymentScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_denominator', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[PaymentScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_nationalcomparisoncategory', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[PaymentScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* ReadmCompDeathScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_score', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[ReadmCompDeathScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_lowerestimate', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[ReadmCompDeathScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_higherestimate', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[ReadmCompDeathScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_denominator', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[ReadmCompDeathScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_nationalcomparisoncategory', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[ReadmCompDeathScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* HealthcareAssociatedInfectionScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_standardizedinfectionratio', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_confidenceintervallower', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_confidenceintervalhigher', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_numerator', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_numberofdaysorpatients', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_nationalcomparisoncategory', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HealthcareAssociatedInfectionScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* MedicareValue'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER('DRGId_' + CAST(mis.[DRGCodeId] as varchar)) + '_averagepayment', 1, 32) + ' "' + SUBSTRING([Name], 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicareValue] mis
INNER JOIN [UNRHealthcareData].[dbo].[DRGCode] m on m.DRGCodeId = mis.DRGCodeId
group by mis.[DRGCodeId], [Name]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER('DRGId_' + CAST(mis.[DRGCodeId] as varchar)) + '_denominator', 1, 32) + ' "' + SUBSTRING([Name], 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicareValue] mis
INNER JOIN [UNRHealthcareData].[dbo].[DRGCode] m on m.DRGCodeId = mis.DRGCodeId
group by mis.[DRGCodeId], [Name]

--INSERT INTO @AllVariables
--SELECT '* HCAHPSSurveyResponse'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([HCAHPSMeasureCode]) + '_answerpercent', 1, 32) + ' "' + SUBSTRING(QuestionText, 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HCAHPSSurveyResponse] mis
INNER JOIN [UNRHealthcareData].[dbo].[HCAHPSMeasure] m on m.HCAHPSMeasureId = mis.HCAHPSMeasureId
group by [HCAHPSMeasureCode], [QuestionText]

--INSERT INTO @AllVariables
--SELECT '* MedicareSpendingByClaimScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER('CTId_' + CAST(mis.[ClaimTypeId] as varchar)) + LOWER('_PNId_' + CAST(mis.[PeriodNameId] as varchar)) + '_avgspendhosp', 1, 32) + ' "' + SUBSTRING([ClaimType], 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicareSpendingByClaimScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[ClaimType] m on m.ClaimTypeId = mis.ClaimTypeId
INNER JOIN [UNRHealthcareData].[dbo].[PeriodName] p on p.PeriodNameId = mis.PeriodNameId
group by mis.[ClaimTypeId], [ClaimType], mis.PeriodNameId, PeriodName
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER('CTId_' + CAST(mis.[ClaimTypeId] as varchar)) + LOWER('_PNId_' + CAST(mis.[PeriodNameId] as varchar)) + '_avgspendstate', 1, 32) + ' "' + SUBSTRING([ClaimType], 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[MedicareSpendingByClaimScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[ClaimType] m on m.ClaimTypeId = mis.ClaimTypeId
INNER JOIN [UNRHealthcareData].[dbo].[PeriodName] p on p.PeriodNameId = mis.PeriodNameId
group by mis.[ClaimTypeId], [ClaimType], mis.PeriodNameId, PeriodName

--INSERT INTO @AllVariables
--SELECT '* HVBPScore'
INSERT INTO @AllVariables
SELECT 'label var ' + REPLACE(REPLACE(SUBSTRING(LOWER([MeasureCode]) + '_performancerate', 1, 32), ' ', ''), '/', '') + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HVBPScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + REPLACE(REPLACE(SUBSTRING(LOWER([MeasureCode]) + '_achievementpoints', 1, 32), ' ', ''), '/', '') + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HVBPScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + REPLACE(REPLACE(SUBSTRING(LOWER([MeasureCode]) + '_improvementpoints', 1, 32), ' ', ''), '/', '') + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HVBPScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + REPLACE(REPLACE(SUBSTRING(LOWER([MeasureCode]) + '_measurescore', 1, 32), ' ', ''), '/', '') + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HVBPScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* CancerSpecificMeasuresScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_numerator', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[CancerSpecificMeasuresScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER([MeasureCode]) + '_denominator', 1, 32) + ' "' + ISNULL(SUBSTRING(MeasureName, 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[CancerSpecificMeasuresScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
group by [MeasureCode], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* TPSScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER('TPSId_' + CAST(mis.[TPSMeasureId] as varchar)) + '_measurescore', 1, 32) + ' "' + SUBSTRING([MeasureName], 1, 80) + '"' + char(13) + char(10)   
FROM [UNRHealthcareData].[dbo].[TPSScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[TPSMeasure] m on m.TPSMeasureId = mis.TPSMeasureId
group by mis.[TPSMeasureId], [MeasureName]

--INSERT INTO @AllVariables
--SELECT '* OutpatientProcedureVolume'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER('MId_' + CAST(mis.[MeasureId] as varchar)) + LOWER('_PTId_' + CAST(mis.[ProcedureTypeId] as varchar)) + '_procedurevolume', 1, 32) + ' "' + ISNULL(SUBSTRING([ProcedureType], 1, 80), '') + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[OutpatientProcedureVolume] mis
INNER JOIN [UNRHealthcareData].[dbo].[Measure] m on m.MeasureId = mis.MeasureId
INNER JOIN [UNRHealthcareData].[dbo].[ProcedureType] p on p.ProcedureTypeId = mis.ProcedureTypeId
group by mis.[MeasureId], [MeasureName], mis.ProcedureTypeId, ProcedureType

--INSERT INTO @AllVariables
--SELECT '* HVBPHCAHPSScore'
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER('MId_' + CAST(mis.[HVBPHCAHPSMeasureId] as varchar)) + '_achievementpoints', 1, 32) + ' "' + SUBSTRING(MeasureName, 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HVBPHCAHPSScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[HVBPHCAHPSMeasure] m on m.HVBPHCAHPSMeasureId = mis.HVBPHCAHPSMeasureId
group by mis.[HVBPHCAHPSMeasureId], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER('MId_' + CAST(mis.[HVBPHCAHPSMeasureId] as varchar)) + '_dimensionscore', 1, 32) + ' "' + SUBSTRING(MeasureName, 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HVBPHCAHPSScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[HVBPHCAHPSMeasure] m on m.HVBPHCAHPSMeasureId = mis.HVBPHCAHPSMeasureId
group by mis.[HVBPHCAHPSMeasureId], [MeasureName]
INSERT INTO @AllVariables
SELECT 'label var ' + SUBSTRING(LOWER('MId_' + CAST(mis.[HVBPHCAHPSMeasureId] as varchar)) + '_improvementpoints', 1, 32) + ' "' + SUBSTRING(MeasureName, 1, 80) + '"' + char(13) + char(10)  
FROM [UNRHealthcareData].[dbo].[HVBPHCAHPSScore] mis
INNER JOIN [UNRHealthcareData].[dbo].[HVBPHCAHPSMeasure] m on m.HVBPHCAHPSMeasureId = mis.HVBPHCAHPSMeasureId
group by mis.[HVBPHCAHPSMeasureId], [MeasureName]

SELECT * FROM @AllVariables