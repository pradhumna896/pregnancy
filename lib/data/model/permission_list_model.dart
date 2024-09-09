// To parse this JSON data, do
//
//     final permissionListModel = permissionListModelFromJson(jsonString);

import 'dart:convert';

PermissionListModel permissionListModelFromJson(String str) =>
    PermissionListModel.fromJson(json.decode(str));

String permissionListModelToJson(PermissionListModel data) =>
    json.encode(data.toJson());

class PermissionListModel {
  // usrer
  final User? createUser;
  final User? updateUser;
  final User? deleteUser;
  final User? restoreUser;
  final User? deleteUserPermanently;
  final User? viewUser;
  final User? viewUserList;
  final User? actionUser;
  final User? trashedUser;

  // role
  final User? createRole;
  final User? updateRole;
  final User? deleteRole;
  final User? restoreRole;
  final User? deleteRolePermanently;
  final User? viewRole;
  final User? viewRoleList;
  final User? trashedRole;
  final User? roleStatus;

  // log
  final User? viewLog;
  // update settings
  final User? updateSetting;
  // template
  final User? createTemplate;
  final User? updateTemplate;
  final User? deleteTemplate;
  final User? restoreTemplate;
  final User? deleteTemplatePermanently;
  final User? viewTemplate;
  final User? viewTemplateList;
  final User? trashedTemplate;
  final User? templateStatus;

  // contract
  final User? createContract;
  final User? updateContract;
  final User? deleteContract;
  final User? restoreContract;
  final User? deleteContractPermanently;
  final User? viewContract;
  final User? viewContractList;
  final User? trashedContract;
  final User? contractStatus;

  // team
  final User? createTeam;
  final User? updateTeam;
  final User? deleteTeam;
  final User? restoreTeam;
  final User? deleteTeamPermanently;
  final User? viewTeam;
  final User? viewTeamList;
  final User? trashedTeam;
  final User? teamStatus;
  // project
  final User? createProject;
  final User? updateProject;
  final User? deleteProject;
  final User? restoreProject;
  final User? deleteProjectPermanently;
  final User? viewProject;
  final User? viewProjectList;
  final User? trashedProject;
  final User? projectStatus;

  // task
  final User? createTask;
  final User? updateTask;
  final User? deleteTask;
  final User? restoreTask;
  final User? deleteTaskPermanently;
  final User? viewTask;
  final User? viewTaskList;
  final User? trashedTask;
  final User? taskStatus;

  // clauseCategory
  final User? createClauseCategory;
  final User? updateClauseCategory;
  final User? deleteClauseCategory;
  final User? restoreClauseCategory;
  final User? deleteClauseCategoryPermanently;
  final User? viewClauseCategory;
  final User? viewClauseCategoryList;
  final User? trashedClauseCategory;
  final User? clauseCategoryStatus;

  // clauseRepository
  final User? createClauseRepository;
  final User? updateClauseRepository;
  final User? deleteClauseRepository;
  final User? restoreClauseRepository;
  final User? deleteClauseRepositoryPermanently;
  final User? viewClauseRepository;
  final User? viewClauseRepositoryList;
  final User? trashedClauseRepository;
  final User? clauseRepositoryStatus;

  // categoryTemplate
  final User? createTemplateCategory;
  final User? updateTemplateCategory;
  final User? deleteTemplateCategory;
  final User? restoreTemplateCategory;
  final User? deleteTemplateCategoryPermanently;
  final User? viewTemplateCategory;
  final User? viewTemplateCategoryList;
  final User? trashedTemplateCategory;
  final User? templateCategoryStatus;

  // organization
  final User? createOrganization;
  final User? updateOrganization;
  final User? deleteOrganization;
  final User? restoreOrganization;
  final User? deleteOrganizationPermanently;
  final User? viewOrganization;
  final User? viewOrganizationList;
  final User? trashedOrganization;
  final User? organizationStatus;

  // workflow
  final User? createWorkflow;
  final User? updateWorkflow;
  final User? deleteWorkflow;
  final User? restoreWorkflow;
  final User? deleteWorkflowPermanently;
  final User? viewWorkflow;
  final User? viewWorkflowList;
  final User? trashedWorkflow;
  final User? workflowStatus;

  // repositoryClause
  final User? createRepositoryClause;
  final User? updateRepositoryClause;
  final User? deleteRepositoryClause;
  final User? restoreRepositoryClause;
  final User? deleteRepositoryClausePermanently;
  final User? viewRepositoryClause;
  final User? viewRepositoryClauseList;
  final User? trashedRepositoryClause;
  final User? repositoryClauseStatus;

  // dashboard
  final User? viewDashboard;

  PermissionListModel({
    this.createUser,
    this.updateUser,
    this.deleteUser,
    this.restoreUser,
    this.deleteUserPermanently,
    this.viewUser,
    this.viewUserList,
    this.actionUser,
    this.trashedUser,
    this.createRole,
    this.updateRole,
    this.deleteRole,
    this.restoreRole,
    this.deleteRolePermanently,
    this.viewRole,
    this.viewRoleList,
    this.trashedRole,
    this.roleStatus,
    this.viewLog,
    this.updateSetting,
    this.createTemplate,
    this.updateTemplate,
    this.deleteTemplate,
    this.restoreTemplate,
    this.deleteTemplatePermanently,
    this.viewTemplate,
    this.viewTemplateList,
    this.trashedTemplate,
    this.templateStatus,
    this.createContract,
    this.updateContract,
    this.deleteContract,
    this.restoreContract,
    this.deleteContractPermanently,
    this.viewContract,
    this.viewContractList,
    this.trashedContract,
    this.contractStatus,
    this.createTeam,
    this.updateTeam,
    this.deleteTeam,
    this.restoreTeam,
    this.deleteTeamPermanently,
    this.viewTeam,
    this.viewTeamList,
    this.trashedTeam,
    this.teamStatus,
    this.createProject,
    this.updateProject,
    this.deleteProject,
    this.restoreProject,
    this.deleteProjectPermanently,
    this.viewProject,
    this.viewProjectList,
    this.trashedProject,
    this.projectStatus,
    this.createTask,
    this.updateTask,
    this.deleteTask,
    this.restoreTask,
    this.deleteTaskPermanently,
    this.viewTask,
    this.viewTaskList,
    this.trashedTask,
    this.taskStatus,
    this.createClauseCategory,
    this.updateClauseCategory,
    this.deleteClauseCategory,
    this.restoreClauseCategory,
    this.deleteClauseCategoryPermanently,
    this.viewClauseCategory,
    this.viewClauseCategoryList,
    this.trashedClauseCategory,
    this.clauseCategoryStatus,
    this.createClauseRepository,
    this.updateClauseRepository,
    this.deleteClauseRepository,
    this.restoreClauseRepository,
    this.deleteClauseRepositoryPermanently,
    this.viewClauseRepository,
    this.viewClauseRepositoryList,
    this.trashedClauseRepository,
    this.clauseRepositoryStatus,
    this.createTemplateCategory,
    this.updateTemplateCategory,
    this.deleteTemplateCategory,
    this.restoreTemplateCategory,
    this.deleteTemplateCategoryPermanently,
    this.viewTemplateCategory,
    this.viewTemplateCategoryList,
    this.trashedTemplateCategory,
    this.templateCategoryStatus,
    this.createOrganization,
    this.updateOrganization,
    this.deleteOrganization,
    this.restoreOrganization,
    this.deleteOrganizationPermanently,
    this.viewOrganization,
    this.viewOrganizationList,
    this.trashedOrganization,
    this.organizationStatus,
    this.createWorkflow,
    this.updateWorkflow,
    this.deleteWorkflow,
    this.restoreWorkflow,
    this.deleteWorkflowPermanently,
    this.viewWorkflow,
    this.viewWorkflowList,
    this.trashedWorkflow,
    this.workflowStatus,
    this.createRepositoryClause,
    this.updateRepositoryClause,
    this.deleteRepositoryClause,
    this.restoreRepositoryClause,
    this.deleteRepositoryClausePermanently,
    this.viewRepositoryClause,
    this.viewRepositoryClauseList,
    this.trashedRepositoryClause,
    this.repositoryClauseStatus,
    this.viewDashboard,
  });

  factory PermissionListModel.fromJson(Map<String, dynamic> json) =>
      PermissionListModel(
        createUser: json["CreateUser"] == null
            ? null
            : User.fromJson(json["CreateUser"]),
        updateUser: json["UpdateUser"] == null
            ? null
            : User.fromJson(json["UpdateUser"]),
        deleteUser: json["DeleteUser"] == null
            ? null
            : User.fromJson(json["DeleteUser"]),
        restoreUser: json["RestoreUser"] == null
            ? null
            : User.fromJson(json["RestoreUser"]),
        deleteUserPermanently: json["DeleteUserPermanently"] == null
            ? null
            : User.fromJson(json["DeleteUserPermanently"]),
        viewUser:
            json["ViewUser"] == null ? null : User.fromJson(json["ViewUser"]),
        viewUserList: json["ViewUserList"] == null
            ? null
            : User.fromJson(json["ViewUserList"]),
        actionUser: json["ActionUser"] == null
            ? null
            : User.fromJson(json["ActionUser"]),
        trashedUser: json["TrashedUser"] == null
            ? null
            : User.fromJson(json["TrashedUser"]),
        createRole: json["CreateRole"] == null
            ? null
            : User.fromJson(json["CreateRole"]),
        updateRole: json["UpdateRole"] == null
            ? null
            : User.fromJson(json["UpdateRole"]),
        deleteRole: json["DeleteRole"] == null
            ? null
            : User.fromJson(json["DeleteRole"]),
        restoreRole: json["RestoreRole"] == null
            ? null
            : User.fromJson(json["RestoreRole"]),
        deleteRolePermanently: json["DeleteRolePermanently"] == null
            ? null
            : User.fromJson(json["DeleteRolePermanently"]),
        viewRole:
            json["ViewRole"] == null ? null : User.fromJson(json["ViewRole"]),
        viewRoleList: json["ViewRoleList"] == null
            ? null
            : User.fromJson(json["ViewRoleList"]),
        trashedRole: json["TrashedRole"] == null
            ? null
            : User.fromJson(json["TrashedRole"]),
        roleStatus: json["RoleStatus"] == null
            ? null
            : User.fromJson(json["RoleStatus"]),
        viewLog:
            json["ViewLog"] == null ? null : User.fromJson(json["ViewLog"]),
        updateSetting: json["UpdateSetting"] == null
            ? null
            : User.fromJson(json["UpdateSetting"]),
        createTemplate: json["CreateTemplate"] == null
            ? null
            : User.fromJson(json["CreateTemplate"]),
        updateTemplate: json["UpdateTemplate"] == null
            ? null
            : User.fromJson(json["UpdateTemplate"]),
        deleteTemplate: json["DeleteTemplate"] == null
            ? null
            : User.fromJson(json["DeleteTemplate"]),
        restoreTemplate: json["RestoreTemplate"] == null
            ? null
            : User.fromJson(json["RestoreTemplate"]),
        deleteTemplatePermanently: json["DeleteTemplatePermanently"] == null
            ? null
            : User.fromJson(json["DeleteTemplatePermanently"]),
        viewTemplate: json["ViewTemplate"] == null
            ? null
            : User.fromJson(json["ViewTemplate"]),
        viewTemplateList: json["ViewTemplateList"] == null
            ? null
            : User.fromJson(json["ViewTemplateList"]),
        trashedTemplate: json["TrashedTemplate"] == null
            ? null
            : User.fromJson(json["TrashedTemplate"]),
        templateStatus: json["TemplateStatus"] == null
            ? null
            : User.fromJson(json["TemplateStatus"]),
        createContract: json["CreateContract"] == null
            ? null
            : User.fromJson(json["CreateContract"]),
        updateContract: json["UpdateContract"] == null
            ? null
            : User.fromJson(json["UpdateContract"]),
        deleteContract: json["DeleteContract"] == null
            ? null
            : User.fromJson(json["DeleteContract"]),
        restoreContract: json["RestoreContract"] == null
            ? null
            : User.fromJson(json["RestoreContract"]),
        deleteContractPermanently: json["DeleteContractPermanently"] == null
            ? null
            : User.fromJson(json["DeleteContractPermanently"]),
        viewContract: json["ViewContract"] == null
            ? null
            : User.fromJson(json["ViewContract"]),
        viewContractList: json["ViewContractList"] == null
            ? null
            : User.fromJson(json["ViewContractList"]),
        trashedContract: json["TrashedContract"] == null
            ? null
            : User.fromJson(json["TrashedContract"]),
        contractStatus: json["ContractStatus"] == null
            ? null
            : User.fromJson(json["ContractStatus"]),
        createProject: json["CreateProject"] == null
            ? null
            : User.fromJson(json["CreateProject"]),
        updateProject: json["UpdateProject"] == null
            ? null
            : User.fromJson(json["UpdateProject"]),
        deleteProject: json["DeleteProject"] == null
            ? null
            : User.fromJson(json["DeleteProject"]),
        restoreProject: json["RestoreProject"] == null
            ? null
            : User.fromJson(json["RestoreProject"]),
        deleteProjectPermanently: json["DeleteProjectPermanently"] == null
            ? null
            : User.fromJson(json["DeleteProjectPermanently"]),
        viewProject: json["ViewProject"] == null
            ? null
            : User.fromJson(json["ViewProject"]),
        viewProjectList: json["ViewProjectList"] == null
            ? null
            : User.fromJson(json["ViewProjectList"]),
        trashedProject: json["TrashedProject"] == null
            ? null
            : User.fromJson(json["TrashedProject"]),
        projectStatus: json["ProjectStatus"] == null
            ? null
            : User.fromJson(json["ProjectStatus"]),
        createTeam: json["CreateTeam"] == null
            ? null
            : User.fromJson(json["CreateTeam"]),
        updateTeam: json["UpdateTeam"] == null
            ? null
            : User.fromJson(json["UpdateTeam"]),
        deleteTeam: json["DeleteTeam"] == null
            ? null
            : User.fromJson(json["DeleteTeam"]),
        restoreTeam: json["RestoreTeam"] == null
            ? null
            : User.fromJson(json["RestoreTeam"]),
        deleteTeamPermanently: json["DeleteTeamPermanently"] == null
            ? null
            : User.fromJson(json["DeleteTeamPermanently"]),
        viewTeam:
            json["ViewTeam"] == null ? null : User.fromJson(json["ViewTeam"]),
        viewTeamList: json["ViewTeamList"] == null
            ? null
            : User.fromJson(json["ViewTeamList"]),
        trashedTeam: json["TrashedTeam"] == null
            ? null
            : User.fromJson(json["TrashedTeam"]),
        teamStatus: json["TeamStatus"] == null
            ? null
            : User.fromJson(json["TeamStatus"]),
        createClauseRepository: json["CreateClauseRepository"] == null
            ? null
            : User.fromJson(json["CreateClauseRepository"]),
        clauseCategoryStatus: json["ClauseCategoryStatus"] == null
            ? null
            : User.fromJson(json["ClauseCategoryStatus"]),
        clauseRepositoryStatus: json["ClauseRepositoryStatus"] == null
            ? null
            : User.fromJson(json["ClauseRepositoryStatus"]),
        createClauseCategory: json["CreateClauseCategory"] == null
            ? null
            : User.fromJson(json["CreateClauseCategory"]),
        updateClauseCategory: json["UpdateClauseCategory"] == null
            ? null
            : User.fromJson(json["UpdateClauseCategory"]),
        deleteClauseCategory: json["DeleteClauseCategory"] == null
            ? null
            : User.fromJson(json["DeleteClauseCategory"]),
        restoreClauseCategory: json["RestoreClauseCategory"] == null
            ? null
            : User.fromJson(json["RestoreClauseCategory"]),
        deleteClauseCategoryPermanently:
            json["DeleteClauseCategoryPermanently"] == null
                ? null
                : User.fromJson(json["DeleteClauseCategoryPermanently"]),
        viewClauseCategory: json["ViewClauseCategory"] == null
            ? null
            : User.fromJson(json["ViewClauseCategory"]),
        viewClauseCategoryList: json["ViewClauseCategoryList"] == null
            ? null
            : User.fromJson(json["ViewClauseCategoryList"]),
        trashedClauseCategory: json["TrashedClauseCategory"] == null
            ? null
            : User.fromJson(json["TrashedClauseCategory"]),
        createOrganization: json["CreateOrganization"] == null
            ? null
            : User.fromJson(json["CreateOrganization"]),
        updateOrganization: json["UpdateOrganization"] == null
            ? null
            : User.fromJson(json["UpdateOrganization"]),
        deleteOrganization: json["DeleteOrganization"] == null
            ? null
            : User.fromJson(json["DeleteOrganization"]),
        restoreOrganization: json["RestoreOrganization"] == null
            ? null
            : User.fromJson(json["RestoreOrganization"]),
        deleteOrganizationPermanently:
            json["DeleteOrganizationPermanently"] == null
                ? null
                : User.fromJson(json["DeleteOrganizationPermanently"]),
        viewOrganization: json["ViewOrganization"] == null
            ? null
            : User.fromJson(json["ViewOrganization"]),
        viewOrganizationList: json["ViewOrganizationList"] == null
            ? null
            : User.fromJson(json["ViewOrganizationList"]),
        trashedOrganization: json["TrashedOrganization"] == null
            ? null
            : User.fromJson(json["TrashedOrganization"]),
        createRepositoryClause: json["CreateRepositoryClause"] == null
            ? null
            : User.fromJson(json["CreateRepositoryClause"]),
        updateRepositoryClause: json["UpdateRepositoryClause"] == null
            ? null
            : User.fromJson(json["UpdateRepositoryClause"]),
        deleteRepositoryClause: json["DeleteRepositoryClause"] == null
            ? null
            : User.fromJson(json["DeleteRepositoryClause"]),
        restoreRepositoryClause: json["RestoreRepositoryClause"] == null
            ? null
            : User.fromJson(json["RestoreRepositoryClause"]),
        deleteRepositoryClausePermanently:
            json["DeleteRepositoryClausePermanently"] == null
                ? null
                : User.fromJson(json["DeleteRepositoryClausePermanently"]),
        viewRepositoryClause: json["ViewRepositoryClause"] == null
            ? null
            : User.fromJson(json["ViewRepositoryClause"]),
        viewRepositoryClauseList: json["ViewRepositoryClauseList"] == null
            ? null
            : User.fromJson(json["ViewRepositoryClauseList"]),
        trashedRepositoryClause: json["TrashedRepositoryClause"] == null
            ? null
            : User.fromJson(json["TrashedRepositoryClause"]),
        createTask: json["CreateTask"] == null
            ? null
            : User.fromJson(json["CreateTask"]),
        updateTask: json["UpdateTask"] == null
            ? null
            : User.fromJson(json["UpdateTask"]),
        deleteTask: json["DeleteTask"] == null
            ? null
            : User.fromJson(json["DeleteTask"]),
        restoreTask: json["RestoreTask"] == null
            ? null
            : User.fromJson(json["RestoreTask"]),
        deleteTaskPermanently: json["DeleteTaskPermanently"] == null
            ? null
            : User.fromJson(json["DeleteTaskPermanently"]),
        viewTask:
            json["ViewTask"] == null ? null : User.fromJson(json["ViewTask"]),
        createTemplateCategory: json["CreateTemplateCategory"] == null
            ? null
            : User.fromJson(json["CreateTemplateCategory"]),
        updateTemplateCategory: json["UpdateTemplateCategory"] == null
            ? null
            : User.fromJson(json["UpdateTemplateCategory"]),
        deleteTemplateCategory: json["DeleteTemplateCategory"] == null
            ? null
            : User.fromJson(json["DeleteTemplateCategory"]),
        restoreTemplateCategory: json["RestoreTemplateCategory"] == null
            ? null
            : User.fromJson(json["RestoreTemplateCategory"]),
        createWorkflow: json["CreateWorkflow"] == null
            ? null
            : User.fromJson(json["CreateWorkflow"]),
        updateWorkflow: json["UpdateWorkflow"] == null
            ? null
            : User.fromJson(json["UpdateWorkflow"]),
        deleteWorkflow: json["DeleteWorkflow"] == null
            ? null
            : User.fromJson(json["DeleteWorkflow"]),
        restoreWorkflow: json["RestoreWorkflow"] == null
            ? null
            : User.fromJson(json["RestoreWorkflow"]),
        deleteWorkflowPermanently: json["DeleteWorkflowPermanently"] == null
            ? null
            : User.fromJson(json["DeleteWorkflowPermanently"]),
        viewWorkflow: json["ViewWorkflow"] == null
            ? null
            : User.fromJson(json["ViewWorkflow"]),
        viewWorkflowList: json["ViewWorkflowList"] == null
            ? null
            : User.fromJson(json["ViewWorkflowList"]),
        trashedWorkflow: json["TrashedWorkflow"] == null
            ? null
            : User.fromJson(json["TrashedWorkflow"]),
        deleteClauseRepository: json["DeleteClauseRepository"] == null
            ? null
            : User.fromJson(json["DeleteClauseRepository"]),
        viewClauseRepository: json["ViewClauseRepository"] == null
            ? null
            : User.fromJson(json["ViewClauseRepository"]),
        viewClauseRepositoryList: json["ViewClauseRepositoryList"] == null
            ? null
            : User.fromJson(json["ViewClauseRepositoryList"]),
        deleteClauseRepositoryPermanently:
            json["DeleteClauseRepositoryPermanently"] == null
                ? null
                : User.fromJson(json["DeleteClauseRepositoryPermanently"]),
        trashedClauseRepository: json["TrashedClauseRepository"] == null
            ? null
            : User.fromJson(json["TrashedClauseRepository"]),
        deleteTemplateCategoryPermanently:
            json["DeleteTemplateCategoryPermanently"] == null
                ? null
                : User.fromJson(json["DeleteTemplateCategoryPermanently"]),
        organizationStatus: json["OrganizationStatus"] == null
            ? null
            : User.fromJson(json["OrganizationStatus"]),
        repositoryClauseStatus: json["RepositoryClauseStatus"] == null
            ? null
            : User.fromJson(json["RepositoryClauseStatus"]),
        restoreClauseRepository: json["RestoreClauseRepository"] == null
            ? null
            : User.fromJson(json["RestoreClauseRepository"]),
        taskStatus: json["TaskStatus"] == null
            ? null
            : User.fromJson(json["TaskStatus"]),
        templateCategoryStatus: json["TemplateCategoryStatus"] == null
            ? null
            : User.fromJson(json["TemplateCategoryStatus"]),
        workflowStatus: json["WorkflowStatus"] == null
            ? null
            : User.fromJson(json["WorkflowStatus"]),
        trashedTask: json["TrashedTask"] == null
            ? null
            : User.fromJson(json["TrashedTask"]),
        trashedTemplateCategory: json["TrashedTemplateCategory"] == null
            ? null
            : User.fromJson(json["TrashedTemplateCategory"]),
        updateClauseRepository: json["UpdateClauseRepository"] == null
            ? null
            : User.fromJson(json["UpdateClauseRepository"]),
        viewDashboard: json["ViewDashboard"] == null
            ? null
            : User.fromJson(json["ViewDashboard"]),
        viewTaskList: json["ViewTaskList"] == null
            ? null
            : User.fromJson(json["ViewTaskList"]),
        viewTemplateCategoryList: json["ViewTemplateCategoryList"] == null
            ? null
            : User.fromJson(json["ViewTemplateCategoryList"]),
        viewTemplateCategory: json["ViewTemplateCategory"] == null
            ? null
            : User.fromJson(json["ViewTemplateCategory"]),
      );

  Map<String, dynamic> toJson() => {
        "CreateUser": createUser?.toJson(),
        "UpdateUser": updateUser?.toJson(),
        "DeleteUser": deleteUser?.toJson(),
        "RestoreUser": restoreUser?.toJson(),
        "DeleteUserPermanently": deleteUserPermanently?.toJson(),
        "ViewUser": viewUser?.toJson(),
        "ViewUserList": viewUserList?.toJson(),
        "ActionUser": actionUser?.toJson(),
        "TrashedUser": trashedUser?.toJson(),
        "CreateRole": createRole?.toJson(),
        "UpdateRole": updateRole?.toJson(),
        "DeleteRole": deleteRole?.toJson(),
        "CreateRepositoryClause": createRepositoryClause?.toJson(),
        "UpdateRepositoryClause": updateRepositoryClause?.toJson(),
        "DeleteRepositoryClause": deleteRepositoryClause?.toJson(),
        "RestoreRepositoryClause": restoreRepositoryClause?.toJson(),
        "DeleteRepositoryClausePermanently":
            deleteRepositoryClausePermanently?.toJson(),
        "ViewRepositoryClause": viewRepositoryClause?.toJson(),
        "ViewRepositoryClauseList": viewRepositoryClauseList?.toJson(),
        "TrashedRepositoryClause": trashedRepositoryClause?.toJson(),
        "CreateTask": createTask?.toJson(),
        "UpdateTask": updateTask?.toJson(),
        "DeleteTask": deleteTask?.toJson(),
        "RestoreTask": restoreTask?.toJson(),
        "DeleteTaskPermanently": deleteTaskPermanently?.toJson(),
        "ViewTask": viewTask?.toJson(),
        "CreateTemplateCategory": createTemplateCategory?.toJson(),
        "UpdateTemplateCategory": updateTemplateCategory?.toJson(),
        "DeleteTemplateCategory": deleteTemplateCategory?.toJson(),
        "RestoreTemplateCategory": restoreTemplateCategory?.toJson(),
        "CreateWorkflow": createWorkflow?.toJson(),
        "UpdateWorkflow": updateWorkflow?.toJson(),
        "DeleteWorkflow": deleteWorkflow?.toJson(),
        "RestoreWorkflow": restoreWorkflow?.toJson(),
        "DeleteWorkflowPermanently": deleteWorkflowPermanently?.toJson(),
        "ViewWorkflow": viewWorkflow?.toJson(),
        "ViewWorkflowList": viewWorkflowList?.toJson(),
        "TrashedWorkflow": trashedWorkflow?.toJson(),
        "DeleteClauseRepository": deleteClauseRepository?.toJson(),
        "ViewClauseRepository": viewClauseRepository?.toJson(),
        "ViewClauseRepositoryList": viewClauseRepositoryList?.toJson(),
        "DeleteClauseRepositoryPermanently":
            deleteClauseRepositoryPermanently?.toJson(),
        "TrashedClauseRepository": trashedClauseRepository?.toJson(),
        "CreateOrganization": createOrganization?.toJson(),
        "UpdateOrganization": updateOrganization?.toJson(),
        "DeleteOrganization": deleteOrganization?.toJson(),
        "RestoreOrganization": restoreOrganization?.toJson(),
        "DeleteOrganizationPermanently":
            deleteOrganizationPermanently?.toJson(),
        "ViewOrganization": viewOrganization?.toJson(),
        "ViewOrganizationList": viewOrganizationList?.toJson(),
        "TrashedOrganization": trashedOrganization?.toJson(),
        "OrganizationStatus": organizationStatus?.toJson(),
        
      };
}

class User {
  final String? slug;
  final String? group;

  User({
    this.slug,
    this.group,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        slug: json["slug"],
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "group": group,
      };
}
