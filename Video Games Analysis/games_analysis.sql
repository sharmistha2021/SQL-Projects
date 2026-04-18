--top 10 most sold games
select *
from "game_sales"
Order by games_sold desc
limit 10;

--Best Years for video games with critic score
select year, round(avg(critic_score),2) as avg_critic_score
from game_sales g
left join reviews r
on g.game=r.game
group by year
order by avg_critic_score desc
limit 10;

--video games year-wise so we know the average games review not just one or two high rating games.
select year, count(r.game) as num_games, round(avg(critic_score),2) as avg_critic_score
from game_sales g
left join reviews r
on g.game=r.game
group by year
having count(r.game) > 4
order by avg_critic_score desc
limit 10;

--games which dropped off the list
select t1.year,t1.avg_critic_score
from top_critic_years t1
where t1.avg_critic_score not in(
select t2.avg_critic_score
from top_critic_years_more_than_four_games t2
where t1.year = t2.year)
order by t1.avg_critic_score desc;

--Best Years for video games with user score
select year, 
	count(r.game) as num_games, 
	round(avg(user_score),2) as avg_user_score
from game_sales g
left join reviews r
on g.game=r.game
group by year
having count(r.game) > 4
order by avg_user_score desc
limit 10;

--Best years for both users ans critics
select t1.year
from top_critic_years_more_than_four_games t1
join top_user_years_more_than_four_games t2
on t1.year = t2.year;

--sales in the best years
select year,
	sum(games_sold) as total_games_sold
from game_sales g
where year in(
	select t1.year
	from top_critic_years_more_than_four_games t1
	join top_user_years_more_than_four_games t2
	on t1.year = t2.year)
group by year
order by total_games_sold desc;