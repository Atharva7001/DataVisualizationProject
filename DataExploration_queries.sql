SELECT * from  [PortfolioProject].[dbo].[CovidDeaths$]
ORDER BY 3,4;

SELECT * from  [PortfolioProject].[dbo].[CovidVaccinations$]
ORDER BY 3,4;

SELECT location,date,total_cases,new_cases,total_deaths,population 
from [PortfolioProject].[dbo].[CovidDeaths$]
order by 1,2;

SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from [PortfolioProject].[dbo].[CovidDeaths$]
where location like 'India'
order by 1,2;

SELECT location,date,population,total_cases,(total_cases/population)*100 as CasesPercentage
from [PortfolioProject].[dbo].[CovidDeaths$]
--where location like 'India'
order by 1,2;

SELECT location,population,MAX(total_cases) as HighestInfectionCount,MAX((total_cases/population)*100) as PercentPopulationInfected
from [PortfolioProject].[dbo].[CovidDeaths$]
group by location,population
order by PercentPopulationInfected desc;

SELECT location,MAX(cast(total_deaths as int)) as TotalDeathCount
from [PortfolioProject].[dbo].[CovidDeaths$]
where continent is not null
group by location
order by TotalDeathCount desc;

SELECT continent,MAX(cast(total_deaths as int)) as TotalDeathCount
from [PortfolioProject].[dbo].[CovidDeaths$]
where continent is not null
group by continent
order by TotalDeathCount desc;

SELECT SUM(new_cases) as TOTAL_CASES,SUM(CAST(new_deaths as int)) as TOTAL_DEATHS,
SUM(CAST(new_deaths as int))/SUM(new_cases)* 100 as DEATH_PERCENTAGE
from PortfolioProject..CovidDeaths$
where continent is not null
order by 1,2


