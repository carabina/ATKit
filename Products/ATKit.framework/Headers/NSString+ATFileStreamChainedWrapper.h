//
//  NSString+ATFileStreamChainedWrapper.h
//  Foundation
//
//  Created by Aesir Titan on 2016-08-13.
//  Copyright © 2016 Titan Studio. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ATFileStreamChainedWrapper)

#pragma mark read

/*!
 *	@author Aesir Titan
 *
 *	@brief read a array
 *
 *	@return a array
 */
- (nullable __kindof NSArray *)readArray;

/*!
 *	@author Aesir Titan
 *
 *	@brief read a dictionary
 *
 *	@return a dictionary
 */
- (nullable __kindof NSDictionary *)readDictionary;

/*!
 *	@author Aesir Titan
 *
 *	@brief read a archived plist file
 *
 *	@return a archived plist file
 */
- (nullable id)readArchivedPlist;

/*!
 *	@author Aesir Titan
 *
 *	@brief read a json file with NSJSONSerialization
 *
 *	@return a json file with NSJSONSerialization
 */
- (nullable id)readJson;

/*!
 *	@author Aesir Titan
 *
 *	@brief read a txt file
 *
 *	@return a txt file
 */
- (nullable NSString *)readTxt;

/*!
 *	@author Aesir Titan
 *
 *	@brief read file
 *
 *	@return a file
 */
- (nullable id)readArchivedFile;

#pragma mark - save

/*!
 *	@author Aesir Titan
 *
 *	@brief save a plist file
 *
 *	@return success or not
 */
- (BOOL(^)(id))savePlist;

/*!
 *	@author Aesir Titan
 *
 *	@brief save a archived plist file
 *
 *	@return success or not
 */
- (BOOL(^)(NSObject<NSCoding> *))saveArchivedPlist;

/*!
 *	@author Aesir Titan
 *
 *	@brief save file
 *
 *	@return success or not
 */
- (BOOL(^)(id <NSCoding>))save;

#pragma mark - remove

/*!
 *	@author Aesir Titan
 *
 *	@brief remove a plist file
 *
 *	@return success or not
 */
- (BOOL)removePlist;

/*!
 *	@author Aesir Titan
 *
 *	@brief remove a json file
 *
 *	@return success or not
 */
- (BOOL)removeJson;

/*!
 *	@author Aesir Titan
 *
 *	@brief remove a txt file
 *
 *	@return success or not
 */
- (BOOL)removeTxt;

/*!
 *	@author Aesir Titan
 *
 *	@brief remove a file
 *
 *	@return success or not
 */
- (BOOL(^)(NSString *))remove;

#pragma mark path

/*!
 *	@author Aesir Titan
 *
 *	@brief return a path in main bundle named 'self'
 *
 *	@return a path in main bundle named 'self'
 */
- (nullable NSString *)mainBundlePath;

/*!
 *	@author Aesir Titan
 *
 *	@brief return a string's documents path
 *
 *	@return a string's documents path
 */
- (NSString *)docPath;

/*!
 *	@author Aesir Titan
 *
 *	@brief return a string's cache path
 *
 *	@return a string's cache path
 */
- (NSString *)cachePath;

/*!
 *	@author Aesir Titan
 *
 *	@brief return a string's temp path
 *
 *	@return a string's temp path
 */
- (NSString *)tempPath;

/*!
 *	@author Aesir Titan
 *
 *	@brief return a string's path
 *
 *	@return a string's path
 */
- (NSString *(^)(NSSearchPathDirectory))path;

#pragma mark - extension

/*!
 *	@author Aesir Titan
 *
 *	@brief append a string's extension
 *
 *	@return a string's path
 */
- (NSString *(^)(NSString *))extension;

/*!
 *	@author Aesir Titan
 *
 *	@brief append extension named '.plist' to current string
 *
 *	@return a path
 */
- (NSString *)plist;

/*!
 *	@author Aesir Titan
 *
 *	@brief append extension named '.json' to current string
 *
 *	@return a path
 */
- (NSString *)json;

/*!
 *	@author Aesir Titan
 *
 *	@brief append extension named '.txt' to current string
 *
 *	@return a path
 */
- (NSString *)txt;

#pragma mark - subpath

/*!
 *	@author Aesir Titan
 *
 *	@brief return all plist file paths
 */
- (nullable NSArray<NSString *> *(^)(NSString *__nullable))subpaths;


@end

NS_ASSUME_NONNULL_END

