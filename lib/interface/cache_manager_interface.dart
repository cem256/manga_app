abstract class ICacheManager<T> {
  final String key;

  ICacheManager(this.key);

  Future<void> init();
  void registerAdapters();
  Future<void> clear();
  List<T> getValues();
  Future<void> putItem(T item);
  Future<void> deleteItem(dynamic key);
}
