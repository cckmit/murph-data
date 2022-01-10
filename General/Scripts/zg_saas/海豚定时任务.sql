
SELECT group_concat(concat(name, description) separator '，') as errJob
FROM dolphinscheduler.t_ds_process_definition;


select concat('未上线任务列表：\n', group_concat(concat(t_ds_project.name, '/', t_ds_process_definition.name) separator '，\n')) as message
from dolphinscheduler.t_ds_process_definition
left join dolphinscheduler.t_ds_project
on t_ds_process_definition.project_id = t_ds_project.id
where release_state = 0 
or exists (
	select 1
	from dolphinscheduler.t_ds_schedules
	where process_definition_id = t_ds_process_definition.id
	and release_state = 0  
)
;

