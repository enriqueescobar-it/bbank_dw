-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-axiom.dbx.sql
-- Source model: bronze_axiom_acct
CREATE OR REPLACE TABLE bronze.default.bronze_axiom_acct AS
-- NAME: BRONZE_AXIOM_ACCT
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: May 22, 2025



WITH landing_data AS (
    SELECT
        ACCT
        ,Description
        ,AX_NewACCT
        ,AX_AcctType
        ,AX_DRCR
        ,AX_ReportSign
        ,AX_BSACCT
        ,AX_YieldDTYPE
        ,AX_Accrual_Basis
        ,AX_BUDACCT
        ,AX_FinStmt
        ,AX_StandardReport
        ,AX_LoanLossReserveCategory
        ,AX_LoanLossReserveType
        ,AX_ForecastAcct
        ,RptLvl1
        ,RptLvl2
        ,RptLvl3
        ,RptLvl4
        ,FTPAcctNum
        ,RptLvl5
        ,BOD_Level
        ,ElimRpt
        ,YieldRpt
        ,Stats_Ratios
        ,ScorecardYieldRpt
        ,Scorecard
        ,MgtglRpt
        ,RAROCBS
        ,RAROCBCAlloc
        ,Strategy
        ,ConsolidatedAuditedFS
        ,InstProf
        ,BradescoMISReporting
        ,CashFlowCategory
        ,StressTesting
        ,BradescoHistorialBasis
        ,BUDReport
        ,Group__CS
        ,GroupActuals
        ,GroupActualsSummary
        ,MISProductLevel1
        ,MISProductLevel2
        ,MISProductLevel3
        ,FTPAcct
        ,DATE_OF_DATA
    FROM
        axiom.default.axiom_acct
)

SELECT *, current_timestamp() AS LOADED_AT FROM landing_data;

-- From bronze-axiom.dbx.sql
-- Source model: bronze_axiom_cds
CREATE OR REPLACE TABLE bronze.default.bronze_axiom_cds AS
-- NAME: BRONZE_AXIOM_CDS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: August 12, 2025



WITH landing_data AS (
    SELECT
        YRMO,
        InstrumentID,
        ITYPE,
        ACCT,
        DEPT,
        PROD,
        CIFID,
        AX_AccrualBasis,
        OFFICERID,
        AX_AvgBal,
        AX_AvgBalAnnualized,
        AX_ClosedDate,
        AX_ClosedThisMonth,
        AX_CurBal,
        AX_DWInterest,
        AX_FTP,
        AX_FTPAnnual,
        AX_FTPRate,
        AX_FTPRateSpread,
        AX_FTPSpread,
        AX_FTPSpreadAnnual,
        AX_Interest,
        AX_InterestAnnual,
        AX_IntIndex,
        AX_IntRate,
        AX_IntSpread,
        AX_IsNonMaturity,
        AX_MatDate,
        AX_MatTerm,
        AX_NextRateResetDate,
        AX_OpenedThisMonth,
        AX_OrigBal,
        AX_OrigDate,
        AX_SourceFileDesc,
        AX_PrevRateResetDate,
        AX_SourceSysDesc,
        AX_RateResetFreq,
        AX_RecCount,
        AX_RenewalDate,
        AX_RenewedThisMonth,
        AX_Status,
        AX_Capital,
        BAC_InstType,
        Company,
        AcctType,
        CDTypeCode,
        ArgoProdType,
        Branch,
        GLGroup,
        GLCostCntr,
        `Status`,
        Class,
        CDNumber,
        StmtCode,
        IntPenalty,
        DepThisTerm,
        WthdrwThisMo,
        IntExpMTD,
        MTDWaived,
        AggrBal,
        AggrDays,
        ConvDate,
        LstStmtDate,
        CDTerm,
        CDTermCode,
        LstRenewTerm,
        OrgnCDTrmCode,
        IntTerm,
        IntTermCode,
        RenewCode,
        DepAcctNmbr,
        RateFloor,
        RateCeiling,
        RateRevTrmCod,
        RateSchdCode,
        RegCDAggDays,
        RegCDAggBal,
        RegCDIntErnd,
        IRAPlanCode,
        IRADistSeq,
        NewAcct,
        ClsRsnCode,
        Renew2Type,
        MTDAggDays,
        CustName,
        MTDIntAccr,
        Residency,
        Postal,
        RedemptionDate,
        GLProdCode,
        Agent,
        HighRisk,
        TierPB,
        TierPrem,
        TierDOMB,
        TierDIGB,
        GroupID,
        GroupDescription,
        CDmatTerm,
        Tier,
        AccInt,
        AX_PmtFreq,
        AX_PmtType,
        AX_NextPmtDate,
        DATE_OF_DATA
    FROM
        axiom.default.axiom_cds
)

SELECT *, current_timestamp() AS LOADED_AT FROM landing_data;

-- From bronze-axiom.dbx.sql
-- Source model: bronze_axiom_devops
CREATE OR REPLACE TABLE bronze.default.bronze_axiom_devops AS
-- NAME: BRONZE_AXIOM_DEVOPS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: August 14, 2025



WITH landing_data AS (
    SELECT
        YRMO,
        InstrumentID,
        ITYPE,
        ACCT,
        DEPT,
        PROD,
        CIFID,
        OFFICERID,
        AX_AccrualBasis,
        AX_AvgBal,
        AX_AvgBalAnnualized,
        AX_ClosedDate,
        AX_ClosedThisMonth,
        AX_CurBal,
        AX_DWInterest,
        AX_FTP,
        AX_FTPAnnual,
        AX_FTPRate,
        AX_FTPRateSpread,
        AX_FTPSpread,
        AX_FTPSpreadAnnual,
        AX_IntRate,
        AX_Interest,
        AX_InterestAnnual,
        AX_IsNonMaturity,
        AX_SourceFileDesc,
        AX_OpenedThisMonth,
        AX_SourceSysDesc,
        AX_OrigBal,
        AX_OrigDate,
        AX_RecCount,
        AX_Status,
        AX_Capital,
        Company,
        Center,
        Branch,
        BACInstType,
        GLGroup,
        GLProdCode,
        Agent,
        SrvcChrg,
        ACC_Method,
        RecordID,
        ACCT_Type,
        ARGO_ProdType,
        CollectOfficer,
        `Status`,
        Class,
        DateOpen,
        DateEnter,
        LastStmnt,
        DateClose,
        ConvDate,
        AggrDays,
        AggrLdgBal,
        CollectedBal,
        AggrDaysPrevCyc,
        AggrLdgBalPrevCyc,
        AggrCollBalPrevCyc,
        AggrDaysThisStmnt,
        AggrLdgThisStmnt,
        AggrDaysIntCyc,
        AggrLdgBalIntCyc,
        StmntCyc,
        StmntCode,
        Num_SC_DR,
        Amt_SC_DR,
        Num_SC_CR,
        Amt_SC_CR,
        Num_OnusATM_CR,
        Num_OnusATM_DR,
        Num_OnusATM_Transf,
        Num_OnusATM_Inq,
        Num_FXATM_CR,
        Num_FXATM_DR,
        AMT_FXATM_Trans,
        Num_FXATM_Inq,
        AmtNSF,
        ODPrivStatus,
        ATM_Card,
        AutoNSF_Chrg,
        ChrgContODFee,
        NumOD_ThisCyc,
        ItemsOD_ThisCyc,
        DaysOD_ThisCyc,
        CksDep_OnUs,
        CksDep_FX,
        CksDep_Local,
        CashDepThisCyc,
        CycTD_Fees,
        CashPdThisCyc,
        TimesRtrnThisCyc,
        ItemsRtrnThisCyc,
        DaysRtrnThisCyc,
        TimesNSFThisCyc,
        ItemsNSFThisCyc,
        DaysNSFThisCyc,
        MTD_SrvcChrg,
        MTD_IntPd,
        MTD_AggrBal,
        MTD_AggrBal2,
        MTD_AggrDays,
        RtrnCkChg_MTD,
        RtrnCkWve_MTD,
        ODChrg_MTD,
        ODChrgWve_MTD,
        NumRtrnChk_MTD,
        TimesOD_MTD,
        TimesNSF_MTD,
        MTD_SrvcChrgWve,
        ChrgOffAmnt,
        CycTD_Waived,
        MTD_Waived,
        CycTD_FeesChrg,
        MTD_FeesChrg,
        CycTD_Refund,
        MTD_Refund,
        OD_RegReport,
        STD_NSFChgsPaid,
        STD_NSFRetItems,
        ACH_CRCyc,
        ACH_CRCyc2,
        ACH_DRCyc,
        ACH_DRCyc2,
        PaperStmntCode,
        WveReasonCode,
        StmntDelMeth,
        ItemsODBal,
        NSFFeesBal,
        ODChrgBal,
        SCBal,
        UCFBal,
        CurBalPrvCyc,
        CardOptInOut,
        BillPay,
        HighRisk,
        EnhancedDueDiligence,
        AmericanExpress,
        Residency,
        Postal,
        TierPB,
        TierPrem,
        TierDOMB,
        TierDIGB,
        GroupID,
        GroupDescription,
        Crossselling,
        Tier,
        DepositType,
        AccInt,
        DATE_OF_DATA
    FROM
        axiom.default.axiom_deposits
)

SELECT *, current_timestamp() AS LOADED_AT FROM landing_data;

-- From bronze-axiom.dbx.sql
-- Source model: bronze_axiom_dmi_chargeoffs
CREATE OR REPLACE TABLE bronze.default.bronze_axiom_dmi_chargeoffs AS
-- NAME: BRONZE_AXIOM_DMI_CHARGEOFFS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: August 12, 2025



WITH landing_data AS (
    SELECT
        InstrumentID,
        YRMO,
        ChargeOffAmt,
        INVID,
        CAT,
        ProdLnCode,
        DATE_OF_DATA
    FROM
        axiom.default.axiom_dmi_chargeoffs
)

SELECT *, current_timestamp() AS LOADED_AT FROM landing_data;

-- From bronze-axiom.dbx.sql
-- Source model: bronze_axiom_dmiloans
CREATE OR REPLACE TABLE bronze.default.bronze_axiom_dmiloans AS
-- NAME: BRONZE_AXIOM_DMILOANS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: August 14, 2025



WITH landing_data AS (
    SELECT
        YRMO,
        InstrumentID,
        ACCT,
        DEPT,
        PROD,
        CIFID,
        OFFICERID,
        AX_AccrualBasis,
        AX_Amortizing,
        AX_AmortTerm,
        AX_AvgBal,
        AX_CurBal,
        AX_CurBalEOM,
        AX_FirstRateResetCap,
        AX_FTP,
        AX_FTPAnnual,
        AX_FTPRate,
        AX_FTPRateSpread,
        AX_FTPSpread,
        AX_FTPSpreadAnnual,
        AX_IntIndex,
        AX_IntRate,
        AX_Interest,
        AX_InterestAnnual,
        AX_IntroRateEndDate,
        AX_IntSpread,
        AX_IsNonMaturity,
        AX_LifeRateCeiling,
        AX_LifeRateFloor,
        AX_MatDate,
        AX_MatTerm,
        AX_NextPmtDate,
        AX_NextRateResetDate,
        AX_NonAccrual,
        AX_OrigBal,
        AX_OrigDate,
        AX_Payment,
        AX_PeriodicRateResetCap,
        AsOfDate,
        LN_NUM,
        AX_PmtFreq,
        OLD_LN_NUM,
        NaturalKey,
        BILLING_NAME,
        AX_PmtType,
        CustAcctNbr,
        INV_ID,
        AX_PrevRateResetDate,
        CAT,
        GL_ACCT,
        NEXT_PMT_DUE_DT,
        AX_RateResetFreq,
        FIRST_PRIN_BAL,
        Company,
        ORIG_MTG_AMT,
        AX_RecCount,
        LN_CLOSING_DT,
        Department,
        LN_MAT_DT,
        AX_RenewalDate,
        ANN_INT_RT,
        ITYPE,
        AX_AvgBalAnnualized,
        AX_DWInterest,
        LN_TRM,
        AX_SourceFileDesc,
        REM_TRM,
        NativeProdCode,
        PRODUCT_LINE_CODE,
        AX_SourceSysDesc,
        ARM_IND,
        NativeCIF,
        ARM_IND_DESC,
        NativeOfficerCode,
        Branch_Number,
        AccountType,
        Officer,
        `Status`,
        Loan_type,
        Class_Code,
        PROP_TYPE_FNMA_CODE,
        PROP_TYPE_FNMA_CODE_DESC,
        INVESTOR_LN_NUM,
        OCCUPANCY_CODE,
        OCCUPANCY_CODE_DESC,
        LN_PURPOSE_CODE,
        LN_PURPOSE_CODE_DESC,
        HI_TYPE,
        HI_TYPE_DESC,
        LO_TYPE,
        LO_TYPE_DESC,
        FIRST_DUE_DT,
        FIRST_P_AND_I_AMT,
        FIRST_SERVICE_FEE_RT,
        FRCLS_STOP_CODE,
        FRCLS_STOP_CODE_DESC,
        ORIG_LN_TO_VAL_RATIO,
        INT_PAID_THROUGH_DT,
        ESCROW_BAL,
        ESCROW_ADV_BAL,
        PLEDGED_LN_TO_CODE,
        PLEDGED_LN_TO_CODE_DESC,
        PMT_PERIOD,
        BAD_CHECK_TABLE,
        TIMES_DLQ,
        TOTAL_MONTHLY_PMT,
        NUM_OF_UNITS,
        INT_FLAG,
        INT_FLAG_DESC,
        CAP_LN_FLAG,
        CAP_LN_FLAG_DESC,
        CUST_LAST_NAME,
        CUST_FIRST_NAME,
        MTG_INS_PAYEE,
        T_AND_I_MONTHLY_AMT,
        GUAR_FEE_AFTER_BUYUP_DOWN_FC,
        RECOURSE_FLAG,
        RECOURSE_FLAG_DESC,
        POOL_NUM,
        BR_OFF_CODE,
        PREPMT_PENALTY_IND,
        FASB_UNAMRT__COSTFEES,
        ARM_NEXT_IR_EFFECTIVE_DT,
        ARM_ORIG_INT_RT,
        ARM_IR_MARGIN_RT,
        ARM_NEXT_PI_EFFECTIVE_DT,
        ARM_IR_CHANGE_PERIOD,
        ARM_PI_CHANGE_PERIOD,
        ARM_IR_MAX_LIFE_CEILING_RT,
        ARM_IR_MAX_LIFE_FLOOR_RT,
        ARM_IR_MAX_INCREASE_RT,
        ARM_IR_MAX_DECREASE_RT,
        ARM_IR_MAX_LIFE_INCR_RT,
        ARM_IR_MAX_LIFE_DECR_RT,
        ARM_PI_MAX_INCR_PCT,
        ARM_PI_MAX_DECR_PCT,
        ARM_PI_MAX_LIFE_AMT,
        ARM_PI_MAX_LIFE_INCR_PCT,
        ARM_PI_MAX_LIFE_DECR_PCT,
        ARM_ORIG_PI_AMT,
        ARM_INITIAL_INDEX_RT,
        ARM_IR_INITIAL_RT,
        ARM_ORIG_IR_CHANGE_DT,
        ARM_IR_ROUND_TYPE,
        ARM_IR_ROUND_DESC,
        ARM_IR_ROUND_FCTR,
        ARM_PLAN_ID,
        ARM_PLAN_ID_DESC,
        ARM_INDEX_CODE_1,
        ARM_INDEX_CODE_1_DESC,
        ARM_INDEX_LEAD_DAYS,
        AX_Date_Entered,
        CustName,
        COCUST_LAST_NAME,
        Residency,
        COCUST_FIRST_NAME,
        Postal,
        FLOOD_ZONE_POS_1,
        ORIGDTYRMO,
        MATDTYRMO,
        ORIG_CRDT_QUAL_CODE,
        CHARGE_OFF_BAL,
        Credit_Qual_Code,
        ChargeOffAmt,
        FEES_Ins_NSF,
        FEES_Proc_Underwriting,
        FEES_DocPrep,
        DaysPastDue,
        WorkOut,
        ProvisionExp,
        ProvisionReserve,
        DaysDelinqunet,
        EnterNonAcc,
        LeaveNonAcc,
        AppraisalDate,
        LnModAppraisalDt,
        LnModAppraisalAmt,
        ChargeOffDt,
        DraftRoutingTranNum,
        FirstOrigCostAmt,
        FirstOrigFeeAmt,
        AX_AmortizationStartDate,
        PropAlphaStateCode,
        OriginalLTV,
        LTVratio,
        PropZipCode,
        ACC_STAT,
        Call_Report_Date,
        Call_Report_Date_Classification,
        AccInt,
        LATE_CHARGE_FCTR,
        GRACE_DAYS,
        LATE_CHARGE_CODE_,
        Prop_Value_amt,
        Orig_Prop_Value_Amt,
        CondoYrBuilt,
        DATE_OF_DATA
    FROM
        axiom.default.axiom_dmiloans
)

SELECT *, current_timestamp() AS LOADED_AT FROM landing_data;

-- From bronze-axiom.dbx.sql
-- Source model: bronze_axiom_instmodelstg
CREATE OR REPLACE TABLE bronze.default.bronze_axiom_instmodelstg AS
-- NAME: BRONZE_AXIOM_INSTMODELSTG
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: May 22, 2025



WITH landing_data AS (
    SELECT
        InstrumentID
        ,REPLACE(
            InstrumentID,
            SUBSTRING(
            	InstrumentID,
                instr(InstrumentID, '_'),
                length(InstrumentID)
            ),
            ''
        ) AS InstrumentType
        ,REPLACE(
            InstrumentID,
            LEFT(InstrumentID, instr(InstrumentID, '_')),
            ''
        ) AS InstrumentCode
        ,ITYPE
        ,ACCT
        ,DEPT
        ,PROD
        ,CIFID
        ,OFFICERID
        ,AX_DQAReviewed
        ,AX_DQAEventCode
        ,AX_AccrualBasis
        ,AX_AmortizationStartDate
        ,AX_Amortizing
        ,AX_AmortTerm
        ,AX_APSFlag
        ,AX_AvgBal
        ,AX_Coupon
        ,AX_CurBal
        ,AX_DaysDelay
        ,AX_FirstRateResetCap
        ,AX_FirstRateResetDate
        ,AX_FTP
        ,AX_FTPEngineType
        ,AX_FTPAnnual
        ,AX_FTPKeyRate
        ,AX_FTPRateSpread
        ,AX_FTPRate
        ,AX_FTPKeyRateName
        ,AX_FTPSpread
        ,AX_FTPSpreadAnnual
        ,AX_IntRate
        ,AX_Interest
        ,AX_InterestAnnual
        ,AX_IntIndex
        ,AX_IntSpread
        ,AX_FTPMessage
        ,AX_IsNonMaturity
        ,AX_IssueDate
        ,AX_LifeRateCeiling
        ,AX_FTPMessageCd
        ,AX_LifeRateFloor
        ,AX_MatDate
        ,AX_MatTerm
        ,AX_FTPMethod
        ,AX_NextPmtDate
        ,AX_NextRateResetDate
        ,AX_NonAccrual
        ,AX_FTPYieldCurve
        ,AX_OrigBal
        ,AX_OrigDate
        ,AX_OrigPrepayRate
        ,AX_OrigPrepayType
        ,AX_Payment
        ,AX_PeriodicRateResetCap
        ,AX_PmtFreq
        ,AX_SourceTable
        ,AX_PmtType
        ,AX_PrepayRate
        ,AX_PrepayType
        ,AX_PrevRateResetDate
        ,AX_RateResetFreq
        ,AX_RecCount
        ,AX_RenewalDate
        ,AX_IntroRateEndDate
        ,LateChargePct
        ,GraceDays
        ,LateChargeCode
        ,DATE_OF_DATA
        ,YRMO AS YEARMONTH
    FROM
        axiom.default.axiom_instmodelstg
)

SELECT *,current_timestamp() AS LOADED_AT FROM landing_data;

-- From bronze-axiom.dbx.sql
-- Source model: bronze_axiom_loans
CREATE OR REPLACE TABLE bronze.default.bronze_axiom_loans AS
-- NAME: BRONZE_AXIOM_LOANS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: August 12, 2025




WITH landing_data AS (
    SELECT
        YRMO,
        InstrumentID,
        ITYPE,
        ACCT,
        DEPT,
        PROD,
        CIFID,
        OFFICERID,
        AX_AccrualBasis,
        AX_AmortizationStartDate,
        AX_Amortizing,
        AX_AmortTerm,
        AX_AvgBal,
        AX_AvgBalAnnualized,
        AX_ClosedDate,
        AX_ClosedThisMonth,
        AX_CurBal,
        AX_CurBalOrig,
        AX_DWInterest,
        AX_FirstRateResetCap,
        AX_FTP,
        AX_FTPAnnual,
        AX_IntIndex,
        AX_FTPRate,
        AX_FTPRateSpread,
        AX_FTPSpread,
        AX_FTPSpreadAnnual,
        AX_IntRate,
        AX_Interest,
        AX_InterestAnnual,
        AX_IntroRateEndDate,
        AX_IntSpread,
        AX_IsNonMaturity,
        AX_LifeRateCeiling,
        AX_LifeRateFloor,
        AX_MatDate,
        AX_MatTerm,
        AX_NextPmtDate,
        AX_NextRateResetDate,
        AX_NonAccrual,
        AX_OpenedThisMonth,
        AX_OrigBal,
        AX_OrigDate,
        AX_Payment,
        AX_PeriodicRateResetCap,
        AX_PmtFreq,
        AX_SourceFileDesc,
        AX_PmtType,
        AX_SourceSysDesc,
        AX_PrevRateResetDate,
        AX_RateResetFreq,
        AX_RecCount,
        AX_RenewalDate,
        AX_RenewedThisMonth,
        AX_Status,
        AX_Capital,
        AsOfDate,
        NaturalKey,
        CustAcctNbr,
        GL_ACCT,
        Company,
        Department,
        NativeProdCode,
        NativeCIF,
        NativeOfficerCode,
        Branch_Number,
        AccountType,
        Officer,
        `Status`,
        Loan_type,
        Class_Code,
        Query_Balance,
        Sold_Balances,
        Bank_Discount,
        Dealer_Discount,
        Assessed_Late_Charges,
        Paid_Late_Charges,
        InterestRebate,
        Dealer_Rebate,
        Princ_and_intpmtamt,
        Billed_Late_Chgs,
        Billed_Other_Chgs,
        Billed_CreditLife,
        Billed_AandH_Insurance,
        Billed_Unemployment,
        Old_PaymentAmount,
        Old_PandI_amount,
        Old_Escrow_pmtamt,
        New_PaymentAmount,
        New_PandI_PmtAmount,
        Balloon_Payment,
        Charge_Off_Amount,
        Shadow_charged_off_principal,
        Shadow_charged_off_interest,
        Shadow_interestapplied_to_principal,
        Shadow_Status,
        Yearly_fee,
        Unpaid_Charges,
        Original_Loan_Date,
        Maturity_Date,
        Date_Entered,
        NextReview_Date,
        FirstPymtDate,
        LastPymtDate,
        NextPymtDue_Date,
        Original_Maturity_Date,
        New_PandI_Effective_Date,
        Date_paid_off,
        Nonaccrual_Date,
        Chg_off_Date,
        Date_on_Watch_list,
        Foreclosure_date,
        Dealer_Rate,
        Upfront_percentage,
        Dealer_Reserve_Pct,
        Total_Interest,
        Rate_Number,
        Rate_Cap_Upwards,
        Rate_Cap_Downwards,
        Rate_Cap_Period_Code,
        Rounding_Method,
        Previous_Rate,
        New_Rate,
        Convertable_ARM,
        Convertable_Index_number,
        Convertable_Variance,
        Convertable_Variance_code,
        Loan_Term_Code,
        Payment_Freq_Code,
        Payment_Code,
        Alternate_PymtSched,
        ProfitPeriod_Late_Chgs,
        ProfitPeriod_ExtFees,
        Profitperiod_Agg_Bal,
        Profitperiod_Int_earned,
        Profitperiod_Agg_Days,
        Times_PastDue_10_29,
        Times_PastDue_30_59,
        Times_PastDue_60_89,
        Times_PastDue_90_119,
        Participation_Code,
        CreditLine_Code,
        DepartmentCode,
        Shadow_processing_flag,
        Shadow_accrual_flag,
        Shadow_reportas_C_O,
        Group_Code_,
        GL_CostCenter_,
        GL_ProductCode,
        Collateral_Code,
        Purpose_Code_,
        Dealer_Num,
        CreditRating_Code,
        Participation_Percent,
        Part_principal_pmt_split_pct,
        Part_int_pmt_split_pct,
        Watch_listCode,
        PrepaymentPenalty_Code,
        Number_of_bad_checks,
        Times_PastDue_120_149,
        Times_PastDue_150_179,
        Times_PastDue_180,
        Participation_Percentage,
        LOC_Fee_Calc_Code,
        LOC_Fee_Frequency,
        LOC_Fee_Freq_Code,
        Unused_Line_Calc_Code,
        Unused_Line_Frequency,
        Unused_Line_Freq_Code,
        Tech_Serv_amount1_,
        Tech_Serv_amount2_,
        Tech_Serv_misc_code_1,
        Tech_Serv_misc_code_2,
        Tech_Serv_misc_code_3,
        Tech_Serv_misc_code_4,
        Primary_Risk_Rating,
        Call_report_code,
        AX_Date_Entered,
        CustName,
        Residency,
        Postal,
        ORIGDTYRMO,
        MATDTYRMO,
        DaysPastDue,
        WorkOut,
        ProvisionExp,
        ProvisionReserve,
        GroupID,
        GroupDescription,
        Agent,
        Insurance,
        AccInt,
        DATE_OF_DATA
    FROM
        axiom.default.axiom_loans
)

SELECT *, current_timestamp() AS LOADED_AT FROM landing_data;

-- From bronze-axiom.dbx.sql
-- Source model: bronze_axiom_ovrntdep
CREATE OR REPLACE TABLE bronze.default.bronze_axiom_ovrntdep AS
-- NAME: BRONZE_AXIOM_OVRNTDEP
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: August 12, 2025



WITH landing_data AS (
    SELECT
        YRMO,
        InstrumentID,
        ACCT,
        DEPT,
        PROD,
        CIFID,
        OFFICERID,
        AX_AccrualBasis,
        AX_Amortizing,
        AX_AmortTerm,
        AX_AvgBal,
        AX_CurBal,
        AX_FirstRateResetCap,
        AX_FTP,
        AX_FTPAnnual,
        AX_FTPRate,
        AX_FTPRateSpread,
        AX_FTPSpread,
        AX_FTPSpreadAnnual,
        AX_IntIndex,
        AX_IntRate,
        AX_Interest,
        AX_InterestAnnual,
        AX_IntroRateEndDate,
        AX_IntSpread,
        AX_IsNonMaturity,
        AX_LifeRateCeiling,
        AX_LifeRateFloor,
        AX_MatDate,
        AX_MatTerm,
        AX_NextPmtDate,
        AX_NextRateResetDate,
        AX_NonAccrual,
        AX_OrigBal,
        AX_OrigDate,
        AX_Payment,
        AX_PeriodicRateResetCap,
        AsOfDate,
        AX_PmtFreq,
        ACCOUNT,
        NaturalKey,
        GL_ACCT,
        AX_PmtType,
        ACCT_TYPE,
        CustAcctNbr,
        CIF,
        AX_PrevRateResetDate,
        SHORT_NAME,
        COMPENSATING_AMT,
        AX_RateResetFreq,
        IBF_INVEST_ACCT,
        Company,
        Year_Base_Code,
        AX_RecCount,
        INV_BLOCK_AMT,
        Department,
        INVESTMENT_RATE,
        AX_RenewalDate,
        COUNTRY_CODE,
        ITYPE,
        INV_TYPE,
        AX_SourceFileDesc,
        CURR_INV_AMT,
        NativeProdCode,
        CURR_INV_DATE,
        AX_SourceSysDesc,
        CURR_INV_RTE,
        NativeCIF,
        CURR_INT_ACCR,
        NativeOfficerCode,
        BAL_B4_INVST,
        Branch_Number,
        AccountType,
        Officer,
        `Status`,
        CustName,
        Residency,
        Postal,
        GroupID,
        GroupDescription,
        DATE_OF_DATA
    FROM
        axiom.default.axiom_ovrntdep
)

SELECT *, current_timestamp() AS LOADED_AT FROM landing_data;
