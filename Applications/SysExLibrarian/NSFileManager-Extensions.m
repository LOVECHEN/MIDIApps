/*
 Copyright (c) 2006-2018, Kurt Revis.  All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of Kurt Revis, nor Snoize, nor the names of other contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "NSFileManager-Extensions.h"


@implementation NSFileManager (SSEExtensions)

- (NSString*) SSE_uniqueFilenameFromName: (NSString*) originalPath
{
    // TODO: Swift conversion note: Keep this in ObjC for now, since the Swift
    // version needs to work with NSURL and/or URL, and the corresponding methods
    // are not available until macOS 10.11.

    NSString* originalPathWithoutExtension = [originalPath stringByDeletingPathExtension];
    NSString* originalPathExtension = [originalPath pathExtension];

    NSString* testPath = originalPath;
    NSUInteger suffix = 0;
    
    while ([self fileExistsAtPath: testPath])
    {
        suffix++;
        testPath = [[originalPathWithoutExtension stringByAppendingFormat: @"-%lu", (unsigned long)suffix] stringByAppendingPathExtension: originalPathExtension];
    }
    
    return testPath;
}

@end
