import 'package:pragnancy_app/theme/theme_helper.dart';

import '../core/app_export.dart';

List menuItems = [
  {
    "id": "view",
    'title': "View",
    "icon": Icons.visibility,
  },
  {"id": "edit", 'title': "Edit", "icon": Icons.edit},
  {"id": "delete", 'title': "Delete", "icon": Icons.delete},
];

List<PopupMenuEntry<String>> popUpMenuList(
    {read = true, delete = true, update = true}) {
  if (read && delete && update) {
    menuItems = [
      {"id": "view", 'title': "View", "icon": Icons.visibility},
      {"id": "edit", 'title': "Edit", "icon": Icons.edit},
      {"id": "delete", 'title': "Delete", "icon": Icons.delete},
    ];
  } else if (read && !delete && !update) {
    menuItems = [
      {"id": "view", 'title': "View", "icon": Icons.visibility},
    ];
  } else if (!read && delete && !update) {
    menuItems = [
      {"id": "delete", 'title': "Delete", "icon": Icons.delete},
    ];
  } else if (!read && !delete && update) {
    menuItems = [
      {"id": "edit", 'title': "Edit", "icon": Icons.edit},
    ];
  } else if (read && delete && !update) {
    menuItems = [
      {"id": "view", 'title': "View", "icon": Icons.visibility},
      {"id": "delete", 'title': "Delete", "icon": Icons.delete},
    ];
  } else if (read && !delete && update) {
    menuItems = [
      {"id": "view", 'title': "View", "icon": Icons.visibility},
      {"id": "edit", 'title': "Edit", "icon": Icons.edit},
    ];
  } else if (!read && delete && update) {
    menuItems = [
      {"id": "edit", 'title': "Edit", "icon": Icons.edit},
      {"id": "delete", 'title': "Delete", "icon": Icons.delete},
    ];
  }

  return menuItems.map((item) {
    return PopupMenuItem<String>(
      value: item['id'],
      child: Row(
        children: [
          Icon(
            item['icon'],
            color: appTheme.orange,
            size: 20,
          ),
          const SizedBox(width: 10),
          Text(
            item['title'],
            style: TextStyle(
                color: appTheme.blueGray900,
                fontSize: 15,
                fontFamily: "OpenSans"),
          ),
        ],
      ),
    );
  }).toList();
}

List menuItemsTypeList = [
  {"id": "view", 'title': "View", "icon": Icons.visibility},
  {"id": "edit", 'title': "Edit", "icon": Icons.edit},
  {"id": "delete", 'title': "Delete", "icon": Icons.delete},
  {"id": "create-attribute", 'title': "Create Attribute", "icon": Icons.add},
  {"id": "list-attribute", 'title': "List Attribute", "icon": Icons.list},
];

List<PopupMenuEntry<String>> popUpMenuTypeList() {
  return menuItemsTypeList.map((item) {
    return PopupMenuItem<String>(
      value: item['id'],
      child: Row(
        children: [
          Icon(
            item['icon'],
            color: appTheme.orange,
            size: 20,
          ),
          const SizedBox(width: 10),
          Text(item['title']),
        ],
      ),
    );
  }).toList();
}
