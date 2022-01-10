-- CONNECTION: url=jdbc:mysql://10.0.12.22:3306/qshop_account
-- mainNoConfigMapper.selectAllQD()

select *
from qshop_account.main_no_config where version_type in(0,'')

/**
    enterpriseStatistics.setAppId(mainNoConfig.getAppId());
    enterpriseStatistics.setEnterpriseName(mainNoConfig.getEnterpriseName());
    enterpriseStatistics.setCompanyName(mainNoConfig.getCompanyName());
    enterpriseStatistics.setBelongIndustry(mainNoConfig.getBelongIndustry());
    enterpriseStatistics.setCarrierId(mainNoConfig.getCarrierId());
    enterpriseStatistics.setLastDays(lastDays);
 */

-- Carrier carrier=carrierMapper.selectByPrimaryKey(mainNoConfig.getCarrierId());

-- insert into enterprise_statistics
