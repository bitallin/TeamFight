# define hero class
import pymysql

from collections import Counter
from itertools import combinations
import time


class hero():
    def __init__(self, name, cost, race, profession):
        self.name = name
        self.cost = cost
        self.race = race
        self.profession = profession

    def __str__(self):
        return self.name


class tactics():
    def __init__(self):
        # data list
        self.hero_name_list = []  # [无双剑姬，麦林炮手]
        self.hero_obj_dic = {}  # {'无双剑姬': obj, '麦林炮手': obj}
        self.race_dic = {}
        self.profession_dic = {}
        self.fetter_dic = {}
        # sql
        self.hero_sql = "select name, cost, race, profession from hero_info"
        self.race_sql = "select race_name, fetter from races"
        self.profession_sql = "select profession_name, fetter from professions"

    def init_data(self):
        # init data hero_obj_list
        for i in self.sel_sql(self.hero_sql):
            hero_obj = hero(i[0], i[1], i[2], i[3])
            self.hero_name_list.append(i[0])
            self.hero_obj_dic[hero_obj.name] = hero_obj

        # init race_list
        for i in self.sel_sql(self.race_sql):
            self.race_dic[i[0]] = i[1]
        # init profession_list
        for i in self.sel_sql(self.profession_sql):
            self.profession_dic[i[0]] = i[1]
        self.fetter_dic.update(self.race_dic)
        self.fetter_dic.update(self.profession_dic)

    def sel_sql(self, sql="select name, cost, race, profession from hero_info"):
        conn = pymysql.connect(host="127.0.0.1", port=3306, user='root', password='root', database='teamfight',
                               charset='utf8')
        cursor = conn.cursor()
        cursor.execute(sql)
        res_sql = cursor.fetchall()
        print('select counts:', str(len(res_sql)))
        cursor.close()
        conn.close()
        return res_sql

    def get_team_fetter_print(self, team_tuple):
        # input: [hero_name]
        # output: [fetter_name: 'm/n']
        team_tuple = tuple(team_tuple)
        fetter_list = []
        all_fetter_dic = {}  # 可激活的羁绊：{'羁绊1': 1, '羁绊2': 2}
        live_fetter_dic = {}  # 激活的羁绊
        for team_hero in team_tuple:
            hero_obj = self.hero_obj_dic[team_hero]
            hero_fetter = []
            races = hero_obj.race.strip().split('|')  # 种族可能有多个，分割成列表
            professions = hero_obj.profession.strip().split('|')
            for race in races:
                fetter_list.append(race)
            for profession in professions:
                fetter_list.append(profession)

        count = Counter(fetter_list)  # 类型： <class 'collections.Counter'>
        all_fetter_dic = dict(count)  # 调用库，自动计算列表中相同元素的个数，并返回字典
        # all_fetter_dic = sorted(all_fetter_dic.items(), key=lambda x:x[1], reverse=True)
        print('统计所有羁绊：', all_fetter_dic)
        # 计算可激活的羁绊中有多少已经激活

        for fetter_name, count in all_fetter_dic.items():
            # 获取该羁绊的激活值列表[2/4/6]
            live_count_list = self.fetter_dic[fetter_name].strip().split('/')  # 返回:['2', '4', '6']
            # print(live_count_list)
            for live_count in reversed(live_count_list):
                # 如果大于激活数，则羁绊被激活
                if count >= int(live_count):
                    next_i = live_count_list.index(live_count) + 1
                    if next_i >= len(live_count_list):
                        next_i -= 1
                    # print(next_i)
                    live_fetter_dic[fetter_name] = str(count) + '/' + live_count_list[next_i]
                    break
        # live_fetter_dic: {'游侠': '2/4', '枪手': '4/4'}
        print('已激活的羁绊：', live_fetter_dic)

        # 对已激活的羁绊进行排序，按照人口数多的排序
        # live_fetter_list: [('枪手', '4/4'), ('游侠', '2/4')]
        # live_fetter_list: [('枪手', '4/4'), ('游侠', '2/4')]
        live_fetter_dic_list = sorted(live_fetter_dic.items(), key=lambda x: int(x[1].strip().split('/')[0]), reverse=True)
        print('已激活的羁绊(排序后)：', live_fetter_list)
        return (live_fetter_list, live_fetter_dic_list)

    def get_team_fetter(self, team_tuple):
        # input: [hero_name]
        # output: ([fetter_name], [fetter_name: 'm/n'])

        team_tuple = tuple(team_tuple)
        fetter_list = []
        live_fetter_list = []
        all_fetter_dic = {}  # 可激活的羁绊：{'羁绊1': 1, '羁绊2': 2}
        live_fetter_dic = {}  # 激活的羁绊
        for team_hero in team_tuple:
            hero_obj = self.hero_obj_dic[team_hero]
            hero_fetter = []
            races = hero_obj.race.strip().split('|')  # 种族可能有多个，分割成列表
            professions = hero_obj.profession.strip().split('|')
            for race in races:
                fetter_list.append(race)
            for profession in professions:
                fetter_list.append(profession)

        count = Counter(fetter_list)  # 类型： <class 'collections.Counter'>
        all_fetter_dic = dict(count)  # 调用库，自动计算列表中相同元素的个数，并返回字典
        # all_fetter_dic = sorted(all_fetter_dic.items(), key=lambda x:x[1], reverse=True)
        # print('统计所有羁绊：', all_fetter_dic)
        # 计算可激活的羁绊中有多少已经激活

        for fetter_name, count in all_fetter_dic.items():
            # 获取该羁绊的激活值列表[2/4/6]
            live_count_list = self.fetter_dic[fetter_name].strip().split('/')  # 返回:['2', '4', '6']

            # print(live_count_list)
            for live_count in reversed(live_count_list):
                # 如果大于激活数，则羁绊被激活
                if count >= int(live_count):
                    next_i = live_count_list.index(live_count) + 1
                    if next_i >= len(live_count_list):
                        next_i -= 1
                    # print(next_i)
                    live_fetter_dic[fetter_name] = str(count) + '/' + live_count_list[next_i]

                    live_fetter_list.append(fetter_name)
                    break
        # live_fetter_dic: {'游侠': '2/4', '枪手': '4/4'}
        # print('已激活的羁绊：', live_fetter_dic)

        # 对已激活的羁绊进行排序，按照人口数多的排序
        # live_fetter_list: [('枪手', '4/4'), ('游侠', '2/4')]
        # live_fetter_list: [('枪手', '4/4'), ('游侠', '2/4')]
        live_fetter_dic = sorted(live_fetter_dic.items(), key=lambda x: int(x[1].strip().split('/')[0]), reverse=True)
        # print('已激活的羁绊(排序后)：', live_fetter_list)
        return (live_fetter_list, live_fetter_dic)

    def get_team_cost(self, team_tuple):
        sum_cost = 0
        for hero in team_tuple:
            sum_cost += int(self.hero_obj_dic[hero].cost)
        res = (sum_cost / len(team_tuple), sum_cost)
        # print('（均费,总费）:', res)
        return res

    def get_team_cost_print(self, team_tuple):
        sum_cost = 0
        for hero in team_tuple:
            sum_cost += int(self.hero_obj_dic[hero].cost)
        res = (sum_cost / len(team_tuple), sum_cost)
        print('（均费,总费）:', res)
        return res

    def generate_team_print(self, population=6, fetter_num=3, max_cost_average=1):
        # input: (人口int，羁绊数量int， 均费float),
        # out: [('暗裔剑魔', '蜘蛛女皇'), ('蒸汽机器人', '九尾妖狐')]
        start = time.time()
        print('-' * 5 + '开始匹配阵容' + '-' * 5)
        all_combination_list = list(combinations(self.hero_name_list, population))
        des_combination_list = []
        print('卡组中%d人口组合共有：%d种:' % (population, len(all_combination_list)))

        for combination in all_combination_list:
            cost_tuple = self.get_team_cost(combination)
            if len(self.get_team_fetter(combination)) >= fetter_num and cost_tuple[0] == max_cost_average:
                des_combination_list.append(combination)
                print('--发现相匹配阵容--')
                print(combination)
                print('--（均费，总费）--')
                print(cost_tuple)
                print('-' * 20)
        print('-' * 5 + '阵容匹配结束' + '-' * 5)
        print('人口%d羁绊%d均费%.2f的组合共有：%d种' % (population, fetter_num, max_cost_average, len(des_combination_list)))
        print('人口%d羁绊%d均费%.2f的组合列表如下:' % (population, fetter_num, max_cost_average))
        print(des_combination_list)

        end = time.time()
        print('-' * 5 + '耗时%s秒' % (end - start) + '-' * 5)
        print()
        return des_combination_list

    def generate_team(self, population=6, fetter_num=3, max_cost_average=1):
        # input: (人口int，羁绊数量int， 均费float),
        # out: [('暗裔剑魔', '蜘蛛女皇'), ('蒸汽机器人', '九尾妖狐')]
        start = time.time()
        all_combination_list = list(combinations(self.hero_name_list, population))
        des_combination_list = []
        for combination in all_combination_list:
            cost_tuple = self.get_team_cost(combination)
            if len(self.get_team_fetter(combination)) >= fetter_num and cost_tuple[0] == max_cost_average:
                des_combination_list.append(combination)
        end = time.time()
        return des_combination_list

    def generate_team_with_hero(self, hero_set, population=6, fetter_num=3, cost_average=2):
        # in: hero_set =['麦林炮手', '法外狂徒'],
        # out: [('诺克萨斯之手', '盖伦', '法外狂徒', '麦林炮手')]
        hero_set = set(hero_set)
        team_np_list = self.generate_team(population, fetter_num, cost_average)
        res_list = []
        for team in team_np_list:
            if hero_set.issubset(team):
                res_list.append(team)

        print('包含:', hero_set, '的', population, '人口', fetter_num, '羁绊的阵容共', len(res_list), '种')
        print(res_list)

        return res_list

    def generate_team_with_fetter(self, population=7, fetter_set=('骑士', '帝国', '剑士'), ):
        hero_pool = []
        fetter_set = set(fetter_set)

        for hero_name in self.hero_obj_dic:
            if self.hero_obj_dic[hero_name].race in fetter_set or self.hero_obj_dic[hero_name].profession in fetter_set:
                hero_pool.append(hero_name)
        print('对应羁绊的备选英雄池规模：',len(hero_pool))
        print('备选英雄池：', hero_pool)
        all_combination_list = list(combinations(hero_pool, population))
        des_combination_list = []
        des_combination_fetter_list = []


        for combination in  all_combination_list:
            fetters_res = self.get_team_fetter(combination)
            #print(set(fetters_res[0]))
            if fetter_set.issubset(set(fetters_res[0])):
                des_combination_list.append(combination)
                des_combination_fetter_list.append(fetters_res[1])

        print('结果如下:', des_combination_list)
        for i in range(len(des_combination_list)):
            print(des_combination_fetter_list[i], ':', des_combination_list[i])
        return des_combination_list




a = tactics()
a.init_data()
# team_list = ['永猎双子', '暗夜猎手', '寒冰射手', '惩戒之箭', '圣枪游侠', '法外狂徒']
# print(a.get_team_fetter(team_list))
# print(a.get_team_fetter_print(('蒸汽机器人', '诺克萨斯之手', '蜘蛛女皇', '铁铠冥魂')))
# a.generate_team_with_hero(['麦林炮手'], 4, fetter_num=2, cost_average=1)
a.generate_team_with_fetter(7,('换形师','恶魔','法师'))
