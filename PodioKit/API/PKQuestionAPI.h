//
//  PKQuestionAPI.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 11/28/11.
//  Copyright (c) 2012 Citrix Systems, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKBaseAPI.h"

@interface PKQuestionAPI : PKBaseAPI

+ (PKRequest *)requestToAnswerQuestionWithId:(NSUInteger)questionId withOptionId:(NSUInteger)optionId referenceId:(NSUInteger)referenceId referenceType:(PKReferenceType)referenceType;

@end
