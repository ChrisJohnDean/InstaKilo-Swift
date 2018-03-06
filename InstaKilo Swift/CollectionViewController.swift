//
//  CollectionViewController.swift
//  InstaKilo Swift
//
//  Created by Chris Dean on 2018-03-05.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"



class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var myCollectionView: UICollectionView!
    private var simpleLayout: UICollectionViewFlowLayout?
    private var photosArray = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSimpleLayout()
        if let simpleLayout = self.simpleLayout {
            myCollectionView.collectionViewLayout = simpleLayout
        }

        // Register cell classes
        self.myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupSimpleLayout() {
        self.simpleLayout?.itemSize = CGSize(width:100, height:100)
        self.simpleLayout?.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        self.simpleLayout?.minimumInteritemSpacing = 15
        self.simpleLayout?.minimumLineSpacing = 10

        self.simpleLayout?.headerReferenceSize = CGSize(width:0, height:50)
        self.simpleLayout?.footerReferenceSize = CGSize(width:0, height:50)
    }
    
    func passPhotoParamaters() {
        
        
        self.createPhotoObjects(myPhoto:"back_porch", location:"MyHouse", subject:"outside")
        self.createPhotoObjects(myPhoto:"bathroom", location:"MyHouse", subject:"inside")
//        [self addPhotoObject:@"bedroom" withLocation:@"MyHouse" withSubject:@"inside"];
//        [self addPhotoObject:@"coat_room" withLocation:@"MyHouse" withSubject:@"inside"];
//        [self addPhotoObject:@"cursed_chalice" withLocation:@"HannahsHouse" withSubject:@"outside"];
//        [self addPhotoObject:@"dining_room" withLocation:@"HannahsHouse" withSubject:@"inside"];
//        [self addPhotoObject:@"dungeon" withLocation:@"HannahsHouse" withSubject:@"inside"];
//        [self addPhotoObject:@"front_door" withLocation:@"HannahsHouse" withSubject:@"outside"];
//        [self addPhotoObject:@"generator" withLocation:@"HannahsHouse" withSubject:@"outside"];
//        [self addPhotoObject:@"kitchen" withLocation:@"JeremysHouse" withSubject:@"inside"];
//        [self addPhotoObject:@"labratory" withLocation:@"JeremysHouse" withSubject:@"inside"];
//        [self addPhotoObject:@"library" withLocation:@"JeremysHouse" withSubject:@"inside"];
//        [self addPhotoObject:@"mysterious_lake" withLocation:@"JeremysHouse" withSubject:@"outside"];
//        [self addPhotoObject:@"secret_passage" withLocation:@"JeremysHouse" withSubject:@"outside"];
//        [self addPhotoObject:@"stairs_up" withLocation:@"JeremysHouse" withSubject:@"inside"];
    }
    
    func createPhotoObjects(myPhoto: String, location: String, subject: String) {
        guard let photo: UIImage = UIImage(named: myPhoto) else {return}
        let photoObject = Photo(myPhoto: photo, subject: subject, location: location)
        self.photosArray.append(photoObject)
    }
/*
     - (void)addPhotoObject:(NSString*)imageName withLocation:(NSString*)location withSubject:(NSString*)subject {
     UIImage *photo = [UIImage imageNamed:imageName];
     PhotoObject *photoObject = [[PhotoObject alloc] initWithPhoto:photo withLocation:location withSubject:subject];
     [self.photoObjects addObject:photoObject];
     }
 */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath as IndexPath)
            
            headerView.backgroundColor = UIColor.blue;
            return headerView
            
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath as IndexPath)
            
            footerView.backgroundColor = UIColor.green;
            return footerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    
//    - (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
//        viewForSupplementaryElementOfKind:(NSString *)kind
//        atIndexPath:(NSIndexPath *)indexPath
//    {
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        MyHeaderView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
//        withReuseIdentifier:@"MyHeaderView"
//        forIndexPath:indexPath];
//    headerView.headerLabel.text = [NSString stringWithFormat:@"%@", self.arrayOfSections[indexPath.section]];
//    return headerView;
//    }
//    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
//    MyFooterView *footerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
//    withReuseIdentifier:@"MyFooterView"
//    forIndexPath:indexPath];
//    //footerView.label.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
//    return footerView;
//    }
//    else {
//    return nil;
//    }
//    }

    
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
