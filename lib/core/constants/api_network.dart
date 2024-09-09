class ApiNetwork {
// BASE URL
  // static const String baseUrl = "https://hrm-api.threemad.com/api/";
  // static const String imageUrl = "https://hrm-api.threemad.com/";
  // static const String fileDownloadUrl = "https://hrm-api.threemad.com/";
  // static const String baseUrl = "http://192.168.1.5:5000/api/";
  static const String imageUrl = "https://demo2.nrt.co.in";
  static const String baseUrl = "https://demo2.nrt.co.in/api/";
  static const String fileDownloadUrl = "http://192.168.1.36:1987/";

  // LOGIN
  static const String login = "${baseUrl}login";
  static const String loginVerify = "${baseUrl}login/verify";
  static const String forgotPassword = "${baseUrl}login/forgot-password";
  static const String dashboard = "${baseUrl}dashboard";
  static const String deleteUsers = "${baseUrl}user/delete/";
  static const String updateUsers = "${baseUrl}user/update";
  static const String logout = "${baseUrl}logout";
  static const String updateProfile = "${baseUrl}update-profile";
  static const String settings = "${baseUrl}settings";
  static const String updateSettings = "${baseUrl}settings/update";
  // ROLES
  static const String roles = "${baseUrl}roles";
  static const String roleTrashed = "${baseUrl}role/trashed";
  static const String roleCreate = "${baseUrl}role/create";
  static const String roleUpdate = "${baseUrl}role/update/";
  static const String permission = "${baseUrl}all-permissions";
  static const String roleDelete = "${baseUrl}role/action/";
  static const String createUser = "${baseUrl}user/create";
  static const String userDelete = "${baseUrl}user/delete/";
  static const String roleDropdown = "${baseUrl}role-dropdown";

  // TASK
  static const String tasks = "${baseUrl}tasks";
  static const String createTask = "${baseUrl}task";
  static const String updateTask = "${baseUrl}task/";

  //PROJECT
  static const String projects = "${baseUrl}projects";
  static const String projectTrashed = "${baseUrl}project/trashed";

  static const String projectDelete = "${baseUrl}project/action/";
  static const String projectCreate = "${baseUrl}project/create/";
  static const String projectUpdate = "${baseUrl}project/update/";
  static const String owner = "${baseUrl}users/without-permission";
  static const String teamsLead = "${baseUrl}teams/without-permission";
  static const String rolesDropdown = "${baseUrl}roles/without-permission";
  static const String organizationsDropdown =
      "${baseUrl}organizations/without-permission";

  // Logs

  static const String contracts = "${baseUrl}contracts";
  static const String contractTrashed = "${baseUrl}contract/trashed";
  static const String contractsAction = "${baseUrl}contract/action/";
  static const String users = "${baseUrl}users";
  static const String usersTrashed = "${baseUrl}user/trashed";
  static const String userUpdate = "${baseUrl}user/update/";
  static const String usersAction = "${baseUrl}user/action/";
  static const String clauseCategory = "${baseUrl}clause-categories";
  static const String clauseCategoryTrashed =
      "${baseUrl}clause-category/trashed";
  static const String clauseCategoryCreate = "${baseUrl}clause-category/create";
  static const String clauseCategoryUpdate =
      "${baseUrl}clause-category/update/";
  static const String clauseDelete = "${baseUrl}clause-category/action/";
  static const String teams = "${baseUrl}teams";
  static const String teamTrashed = "${baseUrl}team/trashed";
  static const String logs = "${baseUrl}logs";
  static const String teamCreate = "${baseUrl}team/create";
  static const String teamUpdate = "${baseUrl}team/update/";
  static const String teamAction = "${baseUrl}team/action";

  // organizations
  static const String organizations = "${baseUrl}organizations";
  static const String organizationsTrashed = "${baseUrl}organization/trashed";
  static const String organizationsCreate = "${baseUrl}organization/create";
  static const String organizationsUpdate = "${baseUrl}organization/update/";
  static const String organizationAction = "${baseUrl}organization/action/";
  static const String workflows = "${baseUrl}workflows";
  static const String workflowsTrashed = "${baseUrl}workflow/trashed";
  static const String workflowsCreate = "${baseUrl}workflow/create";
  static const String actionWorkflow = "${baseUrl}workflow/action/";
  static const String templates = "${baseUrl}templates";
  static const String templatesAction = "${baseUrl}template/action/";
  static const String templateTrashed = "${baseUrl}template/trashed";
  static const String category = "${baseUrl}templates/categories";
  static const String categoryTrashed = "${baseUrl}template/category/trashed";
  static const String categoryAction = "${baseUrl}template/category/action/";
  static const String categoryCreate = "${baseUrl}template/category/create";
  static const String categoryUpdate = "${baseUrl}template/category/update/";
  static const String notifications = "${baseUrl}notifications";
}
