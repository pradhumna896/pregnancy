import '../data/model/permission_list_model.dart';

const permissions = {
  // user permissions
  "CreateUser": {
    "name": 'Create User',
    "description": 'Users with this permission can create new users.',
    "slug": 'create-user',
    "group": 'user',
  },
  "UpdateUser": {
    "name": 'Update User',
    "description": 'Users with this permission can update users.',
    "slug": 'update-user',
    "group": 'user',
  },
  "DeleteUser": {
    "name": 'Delete User',
    "description": 'Users with this permission can delete users.',
    "slug": 'delete-user',
    "group": 'user',
  },
  "RestoreUser": {
    "name": 'Restore User',
    "description": 'Users with this permission can restore users.',
    "slug": 'restore-user',
    "group": 'user',
  },
  "DeleteUserPermanently": {
    "name": 'Delete User Permanently',
    "description": 'Users with this permission can delete users permanently.',
    "slug": 'delete-user-permanently',
    "group": 'user',
  },
  "ViewUser": {
    "name": 'View User',
    "description": 'Users with this permission can view user.',
    "slug": 'view-user',
    "group": 'user',
  },
  "ViewUserList": {
    "name": 'View User List',
    "description": 'Users with this permission can view users.',
    "slug": 'view-user-list',
    "group": 'user',
  },
  "ActionUser": {
    "name": 'Activate / Deactivate User',
    "description": 'Users with this permission can activate / deactivate users.',
    "slug": 'action-user',
    "group": 'user',
  },
  "TrashedUser": {
    "name": 'Trashed User',
    "description": 'Users with this permission can view trashed users.',
    "slug": 'trashed-user',
    "group": 'user',
  },
  // role permissions
  "CreateRole": {
    "name": 'Create Role',
    "description": 'Users with this permission can create roles.',
    "slug": 'create-role',
    "group": 'role',
  },
  "UpdateRole": {
    "name": 'Update Role',
    "description": 'Users with this permission can update roles.',
    "slug": 'update-role',
    "group": 'role',
  },
  "DeleteRole": {
    "name": 'Delete Role',
    "description": 'Users with this permission can delete roles.',
    "slug": 'delete-role',
    "group": 'role',
  },
  "RestoreRole": {
    "name": 'Restore Role',
    "description": 'Users with this permission can restore roles.',
    "slug": 'restore-role',
    "group": 'role',
  },
  "DeleteRolePermanently": {
    "name": 'Delete Role Permanently',
    "description": 'Users with this permission can delete roles permanently.',
    "slug": 'delete-role-permanently',
    "group": 'role',
  },
  "ViewRole": {
    "name": 'View Role',
    "description": 'Users with this permission can view roles.',
    "slug": 'view-role',
    "group": 'role',
  },
  "ViewRoleList": {
    "name": 'View Role List',
    "description": 'Users with this permission can view roles.',
    "slug": 'view-role-list',
    "group": 'role',
  },
  "TrashedRole": {
    "name": 'Trashed Role',
    "description": 'Users with this permission can view trashed roles.',
    "slug": 'trashed-role',
    "group": 'role',
  },

  "RoleStatus": {
    "name": 'Role Status',
    "description": 'Users with this permission can change status.',
    "slug": 'role-status',
    "group": 'role',
  },
  // Log permissions
  "ViewLog": {
    "name": 'View Log',
    "description": 'Users with this permission can view logs.',
    "slug": 'view-log',
    "group": 'log',
  },
  // Update Settings
  "UpdateSetting": {
    "name": 'Update Setting',
    "description": 'Users with this permission can update settings.',
    "slug": 'update-setting',
    "group": 'setting',
  },

  // Template permissions
  "CreateTemplate": {
    "name": 'Create Template',
    "description": 'Users with this permission can create templates.',
    "slug": 'create-template',
    "group": 'template',
  },

  "UpdateTemplate": {
    "name": 'Update Template',
    "description": 'Users with this permission can update templates.',
    "slug": 'update-template',
    "group": 'template',
  },

  "DeleteTemplate": {
    "name": 'Delete Template',
    "description": 'Users with this permission can delete templates.',
    "slug": 'delete-template',
    "group": 'template',
  },

  "RestoreTemplate": {
    "name": 'Restore Template',
    "description": 'Users with this permission can restore templates.',
    "slug": 'restore-template',
    "group": 'template',
  },

  "DeleteTemplatePermanently": {
    "name": 'Delete Template Permanently',
    "description": 'Users with this permission can delete templates permanently.',
    "slug": 'delete-template-permanently',
    "group": 'template',
  },

  "ViewTemplate": {
    "name": 'View Template',
    "description": 'Users with this permission can view templates.',
    "slug": 'view-template',
    "group": 'template',
  },

  "ViewTemplateList": {
    "name": 'View Template List',
    "description": 'Users with this permission can view templates.',
    "slug": 'view-template-list',
    "group": 'template',
  },

  "TrashedTemplate": {
    "name": 'Trashed Template',
    "description": 'Users with this permission can view trashed templates.',
    "slug": 'trashed-template',
    "group": 'template',
  },

  "TemplateStatus": {
    "name": 'Template Status',
    "description": 'Users with this permission can change status.',
    "slug": 'template-status',
    "group": 'template',
  },

  // Contract permissions
  "CreateContract": {
    "name": 'Create Contract',
    "description": 'Users with this permission can create contracts.',
    "slug": 'create-contract',
    "group": 'contract',
  },

  "UpdateContract": {
    "name": 'Update Contract',
    "description": 'Users with this permission can update contracts.',
    "slug": 'update-contract',
    "group": 'contract',
  },

  "DeleteContract": {
    "name": 'Delete Contract',
    "description": 'Users with this permission can delete contracts.',
    "slug": 'delete-contract',
    "group": 'contract',
  },

  "RestoreContract": {
    "name": 'Restore Contract',
    "description": 'Users with this permission can restore contracts.',
    "slug": 'restore-contract',
    "group": 'contract',
  },

  "DeleteContractPermanently": {
    "name": 'Delete Contract Permanently',
    "description": 'Users with this permission can delete contracts permanently.',
    "slug": 'delete-contract-permanently',
    "group": 'contract',
  },

  "ViewContract": {
    "name": 'View Contract',
    "description": 'Users with this permission can view contracts.',
    "slug": 'view-contract',
    "group": 'contract',
  },

  "ViewContractList": {
    "name": 'View Contract List',
    "description": 'Users with this permission can view contracts.',
    "slug": 'view-contract-list',
    "group": 'contract',
  },

  "TrashedContract": {
    "name": 'Trashed Contract',
    "description": 'Users with this permission can view trashed contracts.',
    "slug": 'trashed-contract',
    "group": 'contract',
  },

  "ContractStatus": {
    "name": 'Contract Status',
    "description": 'Users with this permission can change status.',
    "slug": 'contract-status',
    "group": 'contract',
  },

  // Team permissions
  "CreateTeam": {
    "name": 'Create Team',
    "description": 'Users with this permission can create teams.',
    "slug": 'create-team',
    "group": 'team',
  },

  "UpdateTeam": {
    "name": 'Update Team',
    "description": 'Users with this permission can update teams.',
    "slug": 'update-team',
    "group": 'team',
  },

  "DeleteTeam": {
    "name": 'Delete Team',
    "description": 'Users with this permission can delete teams.',
    "slug": 'delete-team',
    "group": 'team',
  },

  "RestoreTeam": {
    "name": 'Restore Team',
    "description": 'Users with this permission can restore teams.',
    "slug": 'restore-team',
    "group": 'team',
  },

  "DeleteTeamPermanently": {
    "name": 'Delete Team Permanently',
    "description": 'Users with this permission can delete teams permanently.',
    "slug": 'delete-team-permanently',
    "group": 'team',
  },

  "ViewTeam": {
    "name": 'View Team',
    "description": 'Users with this permission can view teams.',
    "slug": 'view-team',
    "group": 'team',
  },

  "ViewTeamList": {
    "name": 'View Team List',
    "description": 'Users with this permission can view teams.',
    "slug": 'view-team-list',
    "group": 'team',
  },

  "TrashedTeam": {
    "name": 'Trashed Team',
    "description": 'Users with this permission can view trashed teams.',
    "slug": 'trashed-team',
    "group": 'team',
  },

  "TeamStatus": {
    "name": 'Team Status',
    "description": 'Users with this permission can change status.',
    "slug": 'team-status',
    "group": 'team',
  },

  // Project permissions
  "CreateProject": {
    "name": 'Create Project',
    "description": 'Users with this permission can create projects.',
    "slug": 'create-project',
    "group": 'project',
  },

  "UpdateProject": {
    "name": 'Update Project',
    "description": 'Users with this permission can update projects.',
    "slug": 'update-project',
    "group": 'project',
  },

  "DeleteProject": {
    "name": 'Delete Project',
    "description": 'Users with this permission can delete projects.',
    "slug": 'delete-project',
    "group": 'project',
  },

  "RestoreProject": {
    "name": 'Restore Project',
    "description": 'Users with this permission can restore projects.',
    "slug": 'restore-project',
    "group": 'project',
  },

  "DeleteProjectPermanently": {
    "name": 'Delete Project Permanently',
    "description": 'Users with this permission can delete projects permanently.',
    "slug": 'delete-project-permanently',
    "group": 'project',
  },

  "ViewProject": {
    "name": 'View Project',
    "description": 'Users with this permission can view projects.',
    "slug": 'view-project',
    "group": 'project',
  },

  "ViewProjectList": {
    "name": 'View Project List',
    "description": 'Users with this permission can view projects.',
    "slug": 'view-project-list',
    "group": 'project',
  },

  "TrashedProject": {
    "name": 'Trashed Project',
    "description": 'Users with this permission can view trashed projects.',
    "slug": 'trashed-project',
    "group": 'project',
  },

  "ProjectStatus": {
    "name": 'Project Status',
    "description": 'Users with this permission can change status.',
    "slug": 'project-status',
    "group": 'project',
  },

  // Task permissions

  "CreateTask": {
    "name": 'Create Task',
    "description": 'Users with this permission can create tasks.',
    "slug": 'create-task',
    "group": 'task',
  },

  "UpdateTask": {
    "name": 'Update Task',
    "description": 'Users with this permission can update tasks.',
    "slug": 'update-task',
    "group": 'task',
  },

  "DeleteTask": {
    "name": 'Delete Task',
    "description": 'Users with this permission can delete tasks.',
    "slug": 'delete-task',
    "group": 'task',
  },

  "RestoreTask": {
    "name": 'Restore Task',
    "description": 'Users with this permission can restore tasks.',
    "slug": 'restore-task',
    "group": 'task',
  },

  "DeleteTaskPermanently": {
    "name": 'Delete Task Permanently',
    "description": 'Users with this permission can delete tasks permanently.',
    "slug": 'delete-task-permanently',
    "group": 'task',
  },

  "ViewTask": {
    "name": 'View Task',
    "description": 'Users with this permission can view tasks.',
    "slug": 'view-task',
    "group": 'task',
  },

  "ViewTaskList": {
    "name": 'View Task List',
    "description": 'Users with this permission can view tasks.',
    "slug": 'view-task-list',
    "group": 'task',
  },

  "TrashedTask": {
    "name": 'Trashed Task',
    "description": 'Users with this permission can view trashed tasks.',
    "slug": 'trashed-task',
    "group": 'task',
  },

  "TaskStatus": {
    "name": 'Task Status',
    "description": 'Users with this permission can change status.',
    "slug": 'task-status',
    "group": 'task',
  },

  // Clause Category permissions
  "CreateClauseCategory": {
    "name": 'Create Clause Category',
    "description": 'Users with this permission can create clause categories.',
    "slug": 'create-clause-category',
    "group": 'clause-category',
  },

  "UpdateClauseCategory": {
    "name": 'Update Clause Category',
    "description": 'Users with this permission can update clause categories.',
    "slug": 'update-clause-category',
    "group": 'clause-category',
  },

  "DeleteClauseCategory": {
    "name": 'Delete Clause Category',
    "description": 'Users with this permission can delete clause categories.',
    "slug": 'delete-clause-category',
    "group": 'clause-category',
  },

  "ViewClauseCategory": {
    "name": 'View Clause Category',
    "description": 'Users with this permission can view clause categories.',
    "slug": 'view-clause-category',
    "group": 'clause-category',
  },

  "ViewClauseCategoryList": {
    "name": 'View Clause Category List',
    "description": 'Users with this permission can view clause categories.',
    "slug": 'view-clause-category-list',
    "group": 'clause-category',
  },

  "RestoreClauseCategory": {
    "name": 'Restore Clause Category',
    "description": 'Users with this permission can restore clause categories.',
    "slug": 'restore-clause-category',
    "group": 'clause-category',
  },

  "DeleteClauseCategoryPermanently": {
    "name": 'Delete Clause Category Permanently',
    "description": 'Users with this permission can delete clause categories permanently.',
    "slug": 'delete-clause-category-permanently',
    "group": 'clause-category',
  },

  "TrashedClauseCategory": {
    "name": 'Trashed Clause Category',
    "description": 'Users with this permission can view trashed clause categories.',
    "slug": 'trashed-clause-category',
    "group": 'clause-category',
  },

  "ClauseCategoryStatus": {
    "name": 'Clause Category Status',
    "description": 'Users with this permission can change status.',
    "slug": 'clause-category-status',
    "group": 'clause-category',
  },

  // Clause Repository permissions
  "CreateClauseRepository": {
    "name": 'Create Clause Repository',
    "description": 'Users with this permission can create clause repositories.',
    "slug": 'create-clause-repository',
    "group": 'clause-repository',
  },

  "UpdateClauseRepository": {
    "name": 'Update Clause Repository',
    "description": 'Users with this permission can update clause repositories.',
    "slug": 'update-clause-repository',
    "group": 'clause-repository',
  },

  "DeleteClauseRepository": {
    "name": 'Delete Clause Repository',
    "description": 'Users with this permission can delete clause repositories.',
    "slug": 'delete-clause-repository',
    "group": 'clause-repository',
  },

  "ViewClauseRepository": {
    "name": 'View Clause Repository',
    "description": 'Users with this permission can view clause repositories.',
    "slug": 'view-clause-repository',
    "group": 'clause-repository',
  },

  "ViewClauseRepositoryList": {
    "name": 'View Clause Repository List',
    "description": 'Users with this permission can view clause repositories.',
    "slug": 'view-clause-repository-list',
    "group": 'clause-repository',
  },

  "RestoreClauseRepository": {
    "name": 'Restore Clause Repository',
    "description": 'Users with this permission can restore clause repositories.',
    "slug": 'restore-clause-repository',
    "group": 'clause-repository',
  },

  "DeleteClauseRepositoryPermanently": {
    "name": 'Delete Clause Repository Permanently',
    "description": 'Users with this permission can delete clause repositories permanently.',
    "slug": 'delete-clause-repository-permanently',
    "group": 'clause-repository',
  },

  "TrashedClauseRepository": {
    "name": 'Trashed Clause Repository',
    "description": 'Users with this permission can view trashed clause repositories.',
    "slug": 'trashed-clause-repository',
    "group": 'clause-repository',
  },

  "ClauseRepositoryStatus": {
    "name": 'Clause Repository Status',
    "description": 'Users with this permission can change status.',
    "slug": 'clause-repository-status',
    "group": 'clause-repository',
  },

  // Category permissions
  "CreateTemplateCategory": {
    "name": 'Create Category',
    "description": 'Users with this permission can create categories.',
    "slug": 'create-template-category',
    "group": 'template-category',
  },

  "UpdateTemplateCategory": {
    "name": 'Update Category',
    "description": 'Users with this permission can update categories.',
    "slug": 'update-template-category',
    "group": 'template-category',
  },

  "DeleteTemplateCategory": {
    "name": 'Delete Category',
    "description": 'Users with this permission can delete categories.',
    "slug": 'delete-template-category',
    "group": 'template-category',
  },

  "ViewTemplateCategory": {
    "name": 'View Category',
    "description": 'Users with this permission can view categories.',
    "slug": 'view-template-category',
    "group": 'template-category',
  },

  "ViewTemplateCategoryList": {
    "name": 'View Category List',
    "description": 'Users with this permission can view categories.',
    "slug": 'view-template-category-list',
    "group": 'template-category',
  },

  "RestoreTemplateCategory": {
    "name": 'Restore Category',
    "description": 'Users with this permission can restore categories.',
    "slug": 'restore-template-category',
    "group": 'template-category',
  },

  "DeleteTemplateCategoryPermanently": {
    "name": 'Delete Category Permanently',
    "description": 'Users with this permission can delete categories permanently.',
    "slug": 'delete-template-category-permanently',
    "group": 'template-category',
  },

  "TrashedTemplateCategory": {
    "name": 'Trashed Category',
    "description": 'Users with this permission can view trashed categories.',
    "slug": 'trashed-template-category',
    "group": 'template-category',
  },

  "TemplateCategoryStatus": {
    "name": 'Category Status',
    "description": 'Users with this permission can change status.',
    "slug": 'template-category-status',
    "group": 'template-category',
  },

  // Organization permissions
  "CreateOrganization": {
    "name": 'Create Organization',
    "description": 'Users with this permission can create organizations.',
    "slug": 'create-organization',
    "group": 'organization',
  },

  "UpdateOrganization": {
    "name": 'Update Organization',
    "description": 'Users with this permission can update organizations.',
    "slug": 'update-organization',
    "group": 'organization',
  },

  "DeleteOrganization": {
    "name": 'Delete Organization',
    "description": 'Users with this permission can delete organizations.',
    "slug": 'delete-organization',
    "group": 'organization',
  },

  "RestoreOrganization": {
    "name": 'Restore Organization',
    "description": 'Users with this permission can restore organizations.',
    "slug": 'restore-organization',
    "group": 'organization',
  },

  "DeleteOrganizationPermanently": {
    "name": 'Delete Organization Permanently',
    "description": 'Users with this permission can delete organizations permanently.',
    "slug": 'delete-organization-permanently',
    "group": 'organization',
  },

  "ViewOrganization": {
    "name": 'View Organization',
    "description": 'Users with this permission can view organizations.',
    "slug": 'view-organization',
    "group": 'organization',
  },

  "ViewOrganizationList": {
    "name": 'View Organization List',
    "description": 'Users with this permission can view organizations.',
    "slug": 'view-organization-list',
    "group": 'organization',
  },

  "TrashedOrganization": {
    "name": 'Trashed Organization',
    "description": 'Users with this permission can view trashed organizations.',
    "slug": 'trashed-organization',
    "group": 'organization',
  },

  "OrganizationStatus": {
    "name": 'Organization Status',
    "description": 'Users with this permission can change status.',
    "slug": 'organization-status',
    "group": 'organization',
  },

  // Workflow permissions
  "CreateWorkflow": {
    "name": 'Create Workflow',
    "description": 'Users with this permission can create workflows.',
    "slug": 'create-workflow',
    "group": 'workflow',
  },

  "UpdateWorkflow": {
    "name": 'Update Workflow',
    "description": 'Users with this permission can update workflows.',
    "slug": 'update-workflow',
    "group": 'workflow',
  },

  "DeleteWorkflow": {
    "name": 'Delete Workflow',
    "description": 'Users with this permission can delete workflows.',
    "slug": 'delete-workflow',
    "group": 'workflow',
  },

  "RestoreWorkflow": {
    "name": 'Restore Workflow',
    "description": 'Users with this permission can restore workflows.',
    "slug": 'restore-workflow',
    "group": 'workflow',
  },

  "DeleteWorkflowPermanently": {
    "name": 'Delete Workflow Permanently',
    "description": 'Users with this permission can delete workflows permanently.',
    "slug": 'delete-workflow-permanently',
    "group": 'workflow',
  },

  "ViewWorkflow": {
    "name": 'View Workflow',
    "description": 'Users with this permission can view workflows.',
    "slug": 'view-workflow',
    "group": 'workflow',
  },

  "ViewWorkflowList": {
    "name": 'View Workflow List',
    "description": 'Users with this permission can view workflows.',
    "slug": 'view-workflow-list',
    "group": 'workflow',
  },

  "TrashedWorkflow": {
    "name": 'Trashed Workflow',
    "description": 'Users with this permission can view trashed workflows.',
    "slug": 'trashed-workflow',
    "group": 'workflow',
  },

  "WorkflowStatus": {
    "name": 'Workflow Status',
    "description": 'Users with this permission can change status.',
    "slug": 'workflow-status',
    "group": 'workflow',
  },

  // Repository Clause permissions

  "CreateRepositoryClause": {
    "name": 'Create Repository Clause',
    "description": 'Users with this permission can create repository clauses.',
    "slug": 'create-repository-clause',
    "group": 'repository-clause',
  },

  "UpdateRepositoryClause": {
    "name": 'Update Repository Clause',
    "description": 'Users with this permission can update repository clauses.',
    "slug": 'update-repository-clause',
    "group": 'repository-clause',
  },

  "DeleteRepositoryClause": {
    "name": 'Delete Repository Clause',
    "description": 'Users with this permission can delete repository clauses.',
    "slug": 'delete-repository-clause',
    "group": 'repository-clause',
  },

  "RestoreRepositoryClause": {
    "name": 'Restore Repository Clause',
    "description": 'Users with this permission can restore repository clauses.',
    "slug": 'restore-repository-clause',
    "group": 'repository-clause',
  },

  "DeleteRepositoryClausePermanently": {
    "name": 'Delete Repository Clause Permanently',
    "description": 'Users with this permission can delete repository clauses permanently.',
    "slug": 'delete-repository-clause-permanently',
    "group": 'repository-clause',
  },

  "ViewRepositoryClause": {
    "name": 'View Repository Clause',
    "description": 'Users with this permission can view repository clauses.',
    "slug": 'view-repository-clause',
    "group": 'repository-clause',
  },

  "ViewRepositoryClauseList": {
    "name": 'View Repository Clause List',
    "description": 'Users with this permission can view repository clauses.',
    "slug": 'view-repository-clause-list',
    "group": 'repository-clause',
  },

  // Dashboard permissions
  "ViewDashboard": {
    "name": 'View Dashboard',
    "description": 'Users with this permission can view dashboard.',
    "slug": 'view-dashboard',
    "group": 'dashboard',
  },
} ;

List<String> containList = [];
PermissionListModel? permissionList;
