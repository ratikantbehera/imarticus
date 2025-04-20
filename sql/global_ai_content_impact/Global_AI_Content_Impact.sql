select * from global_ai_content_impact;

# Industry per Country wise Average Job Loss Rate
select Country,Industry,round(avg(JobLossRate),2) as AvgJobLossRate from global_ai_content_impact group by Country,Industry order by Country,AvgJobLossRate desc;

# Worldwide Industry wise Average Job Loss Rate
select Industry,round(avg(JobLossRate),2) as AvgJobLossRate from global_ai_content_impact group by Industry order by AvgJobLossRate desc;

# Country wise Average Job Loss Rate
select Country,round(avg(JobLossRate),2) as AvgJobLossRate from global_ai_content_impact group by Country order by AvgJobLossRate desc;

# Country wise most popular AI Tool
with cte1 as (with cte as (select Country,PopularTool,count(*) as Freq from global_ai_content_impact group by Country,PopularTool)
select *, dense_rank() over (partition by Country order by Freq desc) as drank from cte)
select Country,PopularTool from cte1 where drank=1;

# Industry wise most popular AI Tool
with cte1 as (with cte as (select Industry,PopularTool,count(*) as Freq from global_ai_content_impact group by Industry,PopularTool)
select *, dense_rank() over (partition by Industry order by Freq desc) as drank from cte)
select Industry,PopularTool from cte1 where drank=1;

# Regulation Status wise Avg Adoption Rate
select RegulationStatus,round(avg(AdoptionRate),2) as AvgAdoptRate from global_ai_content_impact group by RegulationStatus;

# Industry and Regulation Status wise Avg Adoption Rate
select Industry,RegulationStatus,round(avg(AdoptionRate),2) as AvgAdoptRate from global_ai_content_impact group by Industry,RegulationStatus;

