//
//  DataManager.swift
//  KXMemo
//
//  Created by Adan on 01/10/2019.
//  Copyright © 2019 Kimdoyoung. All rights reserved.
//

import Foundation
import CoreData

class DataManager {

    static let shared = DataManager()
    private init() {}
    
    var maincontext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var memoList = [Memo]()
    
    func fetchMemo() {
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        let sortByDesc = NSSortDescriptor(key: "insertDate", ascending: false)
        
        request.sortDescriptors = [sortByDesc]
        
        do{
            memoList = try maincontext.fetch(request)
        }catch{
            print(error)
        }
    }
    
    func addNewMemo(_ memo: String?) {
        let newMemo = Memo(context: maincontext)
        
        newMemo.content = memo
        newMemo.insertDate = Date()
     
        saveContext()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "KXMemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
