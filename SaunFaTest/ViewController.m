//
//  ViewController.m
//  SaunFaTest
//
//  Created by lanpeng on 2018/6/1.
//  Copyright © 2018年 lanpeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSMutableArray *dataArr = [NSMutableArray
        arrayWithArray:@[@"13", @"5", @"89", @"20", @"40", @"18", @"120"]];
    // 算法
    // 1. 冒泡排序
    NSLog(@"冒泡排序开始");
    for (int i = 0; i < dataArr.count; i++) {
        for (int j = (int)dataArr.count - 2; j >= i; j--) {
            if ([dataArr[j] integerValue] > [dataArr[j + 1] integerValue]) {
                NSString *temp = dataArr[j];
                dataArr[j] = dataArr[j + 1];
                dataArr[j + 1] = temp;
            }
        }
    }
    NSLog(@"冒泡排序之后数组的顺序--%@", dataArr);

    dataArr = [NSMutableArray
        arrayWithArray:@[@"13", @"5", @"89", @"20", @"40", @"18", @"120"]];
    ///冒泡排序2 优化
    NSLog(@"冒泡排序2开始");
    BOOL flag = YES;
    for (int i = 0; i < dataArr.count && flag; i++) {
        flag = NO;
        for (int j = (int)dataArr.count - 2; j >= i; j--) {
            if ([dataArr[j] intValue] > [dataArr[j + 1] intValue]) {
                NSString *temp = dataArr[j];
                dataArr[j] = dataArr[j + 1];
                dataArr[j + 1] = temp;
                flag = YES;
            }
        }
    }
    NSLog(@"冒泡排序2之后数组的顺序--%@", dataArr);
    /**
   时间复杂度:排序的时间复杂度可用算法执行中的数据比较次数与数据移动次数来衡量。
   后面一般都按平均情况进行估算。对于那些受对象关键字序列初始排列及对象个数影响较大的，需要按最好情况和最坏情况进行估算。
   算法稳定性:假设在数列中存在a[i]=a[j]，若在排序之前，a[i]在a[j]前面；并且排序之后，a[i]仍然在a[j]前面。则这个排序算法是稳定的！
   两两比较 导致交换的次数较多
   复杂度都是O(n^2)
   */

    // 2. 选择排序
    /**   选择排序的特点
   *    我们取出第一个数 然后让它与剩下的数一一比较 那么一轮下来
   我们就能确定最小值
   不稳定排序
   */
    NSLog(@"选择排序开始");
    NSMutableArray *selectArr = [NSMutableArray
        arrayWithArray:@[@"13", @"5", @"89", @"20", @"40", @"18", @"120"]];

    int min;
    for (int i = 0; i < selectArr.count - 1; i++) {
        min = i;
        for (int j = i + 1; j < selectArr.count; j++) {
            if ([selectArr[i] integerValue] > [selectArr[j] integerValue]) {
                min = j;
            }
        }
        if (i != min) {
            NSString *temp = selectArr[i];
            selectArr[i] = selectArr[min];
            selectArr[min] = temp;
        }
    }
    NSLog(@"选择排序之后数组的顺序--%@", selectArr);
    /**
   选择排序和冒泡区别只是减少了交换的次数，所以性能比冒泡好
   复杂度都是O(n^2)
   */

    // 3. 插入排序
    /**   插入排序的特点
   *
   直接插入排序即是在要排序的数组中，假设前n-1（n>=2）个数已经是排好序的，现在要把第n个数插入到前n个已经排好序的数组中，
   使得这n个数也变成有序的，如此反复循环，使得要排序的数组中的最后一个元素也排好序
   */
    NSLog(@"插入排序开始");
    NSMutableArray *insertArr = [NSMutableArray
        arrayWithArray:@[@"120", @"13", @"5", @"89", @"20", @"40", @"18"]];
    int j;
    for (int i = 1; i < insertArr.count; i++) {
        if ([insertArr[i] intValue] < [insertArr[i - 1] intValue]) {
            NSString *temp = insertArr[i];
            //找到temp之前已经有序的数a[j]和temp比较，如果temp小的话，要把这个a[j]往后移动一位
            for (j = i - 1; j >= 0 && [temp intValue] < [insertArr[j] intValue];
                 j--) {
                insertArr[j + 1] = insertArr[j];
            }
            //上一个for跳出时，j+1是最后一个比temp大的数
            insertArr[j + 1] = temp;
        }
    }
    NSLog(@"插入排序最终结果---%@", insertArr);
    /**
   最好情况（原本就是有序的）
   比较次数：Cmin=n-1
   移动次数：Mmin=0
   最差情况（逆序）
   比较次数：Cmax=2+3+4+……+n=(n+2)n/2
   移动次数：Mmax=1+2+3+……+n-1=n*n/2
   若待排序对象序列中出现各种可能排列的概率相同，则可取上述最好情况和最坏情况的平均情况。在平均情况下的关键字比较次数和对象移动次数约为
   n^2/4。因此，直接插入排序的时间复杂度为 O(n^2)。
   另外直接插入排序是一种稳定的排序方法。
   */

    // 4. 希尔排序
    /**  希尔排序是一种插入排序。它是直接插入排序算法的一种加强版
   *   这个不常用
   */
    NSMutableArray *hillArr = [NSMutableArray
        arrayWithArray:@[@"13", @"5", @"89", @"20", @"40", @"18", @"120"]];
    //分成gap个组，对你每一组的元素进行插入排序
    for (int gap = hillArr.count / 2.0; gap >= 1; gap = gap / 2) {
        for (int i = gap; i < hillArr.count; i++) {
            if ([hillArr[i] integerValue] < [hillArr[i - gap] integerValue]) {
                NSString *temp = hillArr[i];
                int j;
                for (j = i - gap;
                     j >= 0 && [temp integerValue] < [hillArr[j] integerValue];
                     j -= gap) {
                    hillArr[j + gap] = hillArr[j];
                }
                hillArr[j + gap] = temp;
            }
        }
    }

    NSLog(@"希尔排序最终结果---%@", hillArr);
    /**
   希尔排序的时间复杂度与增量(即，步长gap)的选取有关。
   当增量为1时，希尔排序退化成了直接插入排序，此时的时间复杂度为O(n^2)
   Hibbard经过复杂证明可使得最坏时间复杂度为O(n^3/2)
   希尔排序是不稳定的算法
   */

    // 6. 快速排序
    /**
   快速排序的基本思想是 ---- 分治法
   1、先从数列中取出一个数作为基准数
   2、将比这个数大的数全放到它的右边，小于或等于它的数全放到它的左边
   3、再对左右区间重复第二步，直到各区间只有一个数
   */
    NSMutableArray *kuaipaiArr = [NSMutableArray
        arrayWithArray:@[@"13", @"5", @"89", @"20", @"40", @"18", @"120"]];

    [self kuaipaiWithArr:kuaipaiArr low:0 hight:kuaipaiArr.count - 1];

    NSLog(@"快速排序最终结果---%@", kuaipaiArr);
    /**
   快速排序时间复杂度 这个比较难：没学过算法导论，下面不太严谨的简单介绍下：
   快速排序的时间复杂度在最坏情况下是O(n^2)，平均的时间复杂度是O(nlogn)。
   这句话很好理解：假设被排序的数列中有n个数。遍历一次的时间复杂度是O(n)，需要遍历多少次呢？至少log(n+1)次，最多n次。
   (01)
   为什么最少是log(n+1)次？快速排序是采用的分治法进行遍历的，我们将它看作一棵二叉树，它需要遍历的次数就是二叉树的深度，而根据完全二叉树的定义，它的深度至少是log(n+1)。因此，快速排序的遍历次数最少是log(n+1)次。
   (02)
   为什么最多是n次？这个应该非常简单，还是将快速排序看作一棵二叉树，它的深度最大是n。因此，快读排序的遍历次数最多是n次。
   快速排序是不稳定的算法

   这只是最简单的快速排序，还有很多优化空间，例如枢轴的选择、优化不必要的交换（把交换改成赋值）、优化小数组的排序方案、减少递归（耗费栈空间）
   */

    //说完排序，在说一个常用的查找
    //二分法查找
    NSArray *erFenArr = @[@"5", @"13", @"20", @"80", @"87", @"100", @"120"];
    NSLog(@"二分查找最终输出的值--%ld",
          (long)[self erFenCheckWithlow:0
                                  hight:erFenArr.count
                                  array:erFenArr
                               selectID:@"80"]);

    /**
   二分查找时间复杂度： O(logn)
   可以把顺序表绘制成一棵二叉树，根据完全二叉树的深度为|log2^n|+1，可知时间复杂度是
   O(logn)。
   二分法不是最好的查找，还有优化空间，例如根据我们要找的关键字key与查找表中最大最小记录的关键字比较后的查找方法，
   就是插值查找
   */
}

// 快排
- (void)kuaipaiWithArr:(NSMutableArray *)kuaipaiarr
                   low:(NSInteger)low
                 hight:(NSInteger)hight {
    if (low >= hight) {
        return;
    }
    NSInteger i = low;
    NSInteger j = hight;
    NSString *temp = kuaipaiarr[i];
    //这个temp其实是枢轴：尽量选择一个值，使得它左边的数比它小，右边的数比它大。

    while (i < j) {
        // i右边的数和i比较，小的话替换i
        while (i < j && [temp integerValue] <= [kuaipaiarr[j] integerValue]) {
            j--;
        }
        kuaipaiarr[i] = kuaipaiarr[j];
        // j左边的数和i比较，大的话替换j
        while (i < j && [temp integerValue] >= [kuaipaiarr[i] integerValue]) {
            i++;
        }
        kuaipaiarr[j] = kuaipaiarr[i];
        // i < j 继续循环
    }
    // i == j循环跳出 这样一次循环就能让i前面的数都小于temp，右边的数都大于temp
    //然后再分别对前（1~i-1）和后（i+1~n））个数循环
    kuaipaiarr[i] = temp;
    [self kuaipaiWithArr:kuaipaiarr low:low hight:i - 1];
    [self kuaipaiWithArr:kuaipaiarr low:i + 1 hight:hight];
}

// 二分查找
- (NSInteger)erFenCheckWithlow:(NSInteger)low
                         hight:(NSInteger)hight
                         array:(NSArray *)array
                      selectID:(NSString *)key {
    if (low < hight) {
        NSInteger mid = (low + hight) / 2; //对mid值选取的不同，直接影响查找效率

        if ([key integerValue] == [array[mid] integerValue]) {
            return mid;
        } else if ([key integerValue] < [array[mid] integerValue]) {
            return
                [self erFenCheckWithlow:low
                                  hight:mid - 1
                                  array:array
                               selectID:key];
        } else {
            return
                [self erFenCheckWithlow:mid + 1
                                  hight:hight
                                  array:array
                               selectID:key];
        }
    } else {
        return -1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
