Maxson
=========

Use Maxson to export a core data managed object to a dictionary and import that dictionary back to a managed object. This is not a full core data import/export, since it imports/exports only from/to ONE managed object. 

Usage
--
Import the `NSManagedObject+MXNSerializable.h` category on your managed objects you wish to export. This will add methods that will export all attributes and relationships. Limit the export of attributes or relationships by creating the two methods `mxn_serializableAttributeNames` and `mxn_serializableRelationshipNames` of the category yourself and returning the attribute and relationship names which should be considered. You can specify that on a per object basis.
Additionally track the imported or exported objects using the visitDuringImport/-Export methods. You can access them after the import/export using the properties `visitedDuringExport` and `visitedDuringImport` in the `MXNAdapter.h`.

Use `MXNAdapter`'s
```objective-c
- (NSDictionary *)dictionaryForManagedObject:(NSManagedObject<MXNSerializable> *)object
```
to get a dictionary representation of the object including all attributes and all the other objects which are reachable (if not limited by `mxn_serializable*Names`).

Use `MXNAdapter`'s
```objective-c
- (NSManagedObject *)managedObjectsForDictionary:(NSDictionary *)dictionary managedObjectContext:(NSManagedObjectContext *)managedObjectContext
```
to translate that dictionary back to a managed objects graph. You have to save the context yourself. You can query the object graph using the returned root object. For specific objects it is some times easier to track and access them via the `visitedDuringImport`.

Maxson uses $id and $ref as keys for identifying and referencing objects in the dictionary. They have to be the same for import and export. Supply own keys using the `- (instancetype)initWithObjIdKey:(NSString *)objIdKey objRefKey:(NSString *)objRefKey`.

Installation
----
```
pod "Maxson", :git => "https://github.com/beheim/Maxson"
```

License
----
MIT
