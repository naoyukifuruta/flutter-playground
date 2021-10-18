# shared_preferences_sample

簡単に導入できるデータ永続化パッケージ。

Key/Value形式での保存が可能。

（iOSのNSUserDefaults、AndroidのSharedPreferencesラッパー）

## 導入パッケージ

[shared_preferences | Flutter Package](https://pub.dev/packages/shared_preferences)

## 使い方

### 保存可能なデータ型

- int
- double
- bool
- String
- List<String>

### 保存

```dart
final prefs = await SharedPreferences.getInstance();
prefs.setInt('count', 0);
prefs.setDouble('w', 70.3);
prefs.setBool('isDark', true);
prefs.setString('name', 'hoge');
prefs.setStringList('blood', ['A', 'B', 'O', 'AB']);
```

### 取得

```dart
final prefs = await SharedPreferences.getInstance();
final count = prefs.getInt('count') ?? 0;
final w = prefs.getDouble('w') ?? 80.3;
final isDark = prefs.getBool('isDark') ?? false;
final name = prefs.getString('name') ?? '';
final bloodType = prefs.getStringList('blood') ?? [];
```

### 削除

```dart
final prefs = await SharedPreferences.getInstance();
prefs.remove('counter');
// 全削除
prefs.clear();
```

