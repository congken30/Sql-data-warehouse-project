/* 
=========================================================================
Stored Procedure : Load Bronze Layer ( Source -> Bronze ) 
=========================================================================
Script Purpose 
      This stored procedure loads data into the bronze schema from external CSV files . 
      It perfroms the following actions : 
      - Truncates the bronze tables before loading data 
      - Uses the ' BULK INSERT; command to load data from csv files to bronze tables 

Parameters : 
      none 
      This stored procedure does not accept any parameters or rerturn any values. 

Usage Example : 
      Exec bronze.load_bronze;
=========================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN 
	DECLARE @start_time DATETIME, @end_time DATETIME
	BEGIN TRY 
		PRINT '==========================================='
		print 'Loading Bronze Layer'
		PRINT '==========================================='

		print '-------------------------------------------'
		print 'Loading CRM Tables'
		print '-------------------------------------------'

		set @start_time = getdate();
		print '>>Truncating Table: bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;

		print '>>Inserting Table: bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info 
		From 'E:\Data_Analysis\SQL_comprehensive\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR  = ',',
			TABLOCK
		)
		set @end_time= getdate()
		Print '>> load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'seconds'
		print '>> -----------------'

		set @start_time = getdate();
		print '>>Truncating Table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;

		print '>>Inserting Table: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		From 'E:\Data_Analysis\SQL_comprehensive\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR  = ',',
			TABLOCK
		)
		set @end_time= getdate()
		Print '>> load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'seconds'
		print '>> -----------------'

		set @start_time = getdate();
		print '>>Truncating Table: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;

		print '>>Inserting Table: bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		From 'E:\Data_Analysis\SQL_comprehensive\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR  = ',',
			TABLOCK
		)
		set @end_time= getdate()
		Print '>> load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'seconds'
		print '>> -----------------'

		print '-------------------------------------------'
		print 'Loading ERP Tables'
		print '-------------------------------------------'

		set @start_time = getdate();
		print '>>Truncating Table: bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12;

		print '>>Inserting Table: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		From 'E:\Data_Analysis\SQL_comprehensive\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR  = ',',
			TABLOCK
		)
		set @end_time= getdate()
		Print '>> load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'seconds'
		print '>> -----------------'

		set @start_time = getdate();
		print '>>Truncating Table: bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;

		print '>>Truncating Table: bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		From 'E:\Data_Analysis\SQL_comprehensive\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR  = ',',
			TABLOCK
		)
		set @end_time= getdate()
		Print '>> load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'seconds'
		print '>> -----------------'

		set @start_time = getdate();
		print '>>Truncating Table: bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		print '>>Truncating Table: bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		From 'E:\Data_Analysis\SQL_comprehensive\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR  = ',',
			TABLOCK
		)
		set @end_time= getdate()
		Print '>> load Duration : ' + cast(datediff(second,@start_time, @end_time) as nvarchar) + 'seconds'
		print '>> -----------------'
		;
	END TRY 
	BEGIN CATCH 
		Print '==============================='
		print 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_Message();
		print 'Error Message' + CAST (ERROR_NUMBER() as nvarchar);
		print 'Error Message' + CAST (ERROR_NUMBER() as nvarchar);
		print '==============================='
	END CATCH
END




