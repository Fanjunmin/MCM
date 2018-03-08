function [G]=BuildG()
G=zeros(130,130);

%%塀劔！！！！！！！！！！！！！！！

G=addEdge(G,'D1','J11',1);
G=addEdge(G,'D1','J10',1);
G=addEdge(G,'D1','J09',1);
G=addEdge(G,'D1','Z03',1);

%%恣碕！！吏貧！！！！！！！！！！！！！！

G=addEdge(G,'j20','j31',1);
G=addEdge(G,'j20','j19',2);

G=addEdge(G,'j19','j31',1);
G=addEdge(G,'j19','j43',1);
G=addEdge(G,'j19','j18',2);

G=addEdge(G,'j29','j18',1);
G=addEdge(G,'j41','j18',1);
G=addEdge(G,'j17','j18',2);

G=addEdge(G,'z06','j16',1);
G=addEdge(G,'j39','j16',1);
G=addEdge(G,'j15','j16',2);
G=addEdge(G,'j17','j16',2);

G=addEdge(G,'j15','j14',2);
G=addEdge(G,'j15','j25',1);
G=addEdge(G,'j37','j15',1);

G=addEdge(G,'j14','j21',1);
G=addEdge(G,'j14','j35',1);
G=addEdge(G,'j13','j14',2);

G=addEdge(G,'j13','j21',1);
G=addEdge(G,'j13','j32',1);
G=addEdge(G,'j13','j12',2);

G=addEdge(G,'j12','d2',1);
G=addEdge(G,'j12','j32',1);

%%1曝！！貫貧！！！！！！！！！！！！

G=addEdge(G,'j21','f01',1);
G=addEdge(G,'j21','f02',1);
G=addEdge(G,'j21','f03',1);
G=addEdge(G,'j22','j21',1);

G=addEdge(G,'j22','f06',1);
G=addEdge(G,'j22','f04',1);
G=addEdge(G,'j22','f05',1);
G=addEdge(G,'j22','j23',1);

G=addEdge(G,'j23','f07',1);
G=addEdge(G,'j23','j25',1);
G=addEdge(G,'j23','j24',1);

G=addEdge(G,'j24','f08',1);
G=addEdge(G,'j24','f09',1);
G=addEdge(G,'j24','j25',1);
G=addEdge(G,'j24','j26',1);

G=addEdge(G,'j26','f12',1);
G=addEdge(G,'j26','f13',1);
G=addEdge(G,'j26','j27',1);
G=addEdge(G,'j26','z06',1);

G=addEdge(G,'j27','f16',1);
G=addEdge(G,'j27','f15',1);
G=addEdge(G,'j27','f14',1);
G=addEdge(G,'j27','f17',1);
G=addEdge(G,'j27','j28',1);

%---

G=addEdge(G,'j25','f11',1);
G=addEdge(G,'j25','f10',1);
G=addEdge(G,'j25','z06',1);

G=addEdge(G,'j28','z06',1);

G=addEdge(G,'j28','f18',1);
G=addEdge(G,'j28','f19',1);
G=addEdge(G,'j28','j29',1);
G=addEdge(G,'j28','j30',1);

G=addEdge(G,'j29','f20',1);
G=addEdge(G,'j29','j30',1);
G=addEdge(G,'j29','j31',1);

G=addEdge(G,'j30','f21',1);
G=addEdge(G,'j30','f22',1);
G=addEdge(G,'j30','j31',1);

G=addEdge(G,'j31','f23',1);

%%2曝！！！！�鯢蓮�！！！！！！！！！

G=addEdge(G,'j43','j44',1);

G=addEdge(G,'j44','f41',1);
G=addEdge(G,'j44','f42',1);
G=addEdge(G,'j44','j45',1);
G=addEdge(G,'j44','j46',1);
G=addEdge(G,'j44','z05',1);

G=addEdge(G,'j45','j46',1);
G=addEdge(G,'j45','j10',1);
G=addEdge(G,'j45','j09',1);
G=addEdge(G,'j45','j42',1);

G=addEdge(G,'j41','f40',1);
G=addEdge(G,'j41','z05',1);

G=addEdge(G,'j42','j08',1);
G=addEdge(G,'j42','j38',1);
G=addEdge(G,'j42','j40',1);

G=addEdge(G,'j40','f39',1);
G=addEdge(G,'j40','f38',1);
G=addEdge(G,'j40','f37',1);
G=addEdge(G,'j40','j39',1);

G=addEdge(G,'j39','f36',1);

G=addEdge(G,'j38','f34',1);
G=addEdge(G,'j38','z04',1);
G=addEdge(G,'j38','f35',1);

G=addEdge(G,'j37','f33',1);
G=addEdge(G,'j37','f31',1);
G=addEdge(G,'j37','f32',1);
G=addEdge(G,'j37','z04',1);

G=addEdge(G,'j36','f29',1);
G=addEdge(G,'j36','f30',1);
G=addEdge(G,'j36','j34',1);
G=addEdge(G,'j36','j06',1);

G=addEdge(G,'j34','j35',1);
G=addEdge(G,'j34','f26',1);
G=addEdge(G,'j34','j05',1);
G=addEdge(G,'j34','j33',1);

G=addEdge(G,'j35','f27',1);
G=addEdge(G,'j35','f28',1);

G=addEdge(G,'j33','f25',1);
G=addEdge(G,'j33','j32',1);
G=addEdge(G,'j33','j03',1);
G=addEdge(G,'j33','j04',1);

G=addEdge(G,'j32','f24',1);
G=addEdge(G,'j32','j03',1);
G=addEdge(G,'j32','d2',1);

G=addEdge(G,'j46','f43',1);
G=addEdge(G,'j46','j11',1);

%%碕嘔！！！！！！！！！！！！！！

G=addEdge(G,'j11','j10',2);

G=addEdge(G,'j10','j09',2);

G=addEdge(G,'j09','j08',2);
G=addEdge(G,'j09','z03',1);

G=addEdge(G,'j08','j52',1);
G=addEdge(G,'j08','j07',2);

G=addEdge(G,'j07','z04',1);
G=addEdge(G,'j07','j06',1);
G=addEdge(G,'j07','j52',1);

G=addEdge(G,'j06','j51',1);
G=addEdge(G,'j06','j05',2);

G=addEdge(G,'j05','j49',1);
G=addEdge(G,'j05','j04',2);

G=addEdge(G,'j04','j50',1);
G=addEdge(G,'j04','z01',1);
G=addEdge(G,'j04','j03',2);

G=addEdge(G,'j03','j48',1);
G=addEdge(G,'j03','d2',1);
G=addEdge(G,'j03','j02',2);

G=addEdge(G,'j02','j47',1);
G=addEdge(G,'j02','d2',1);
G=addEdge(G,'j02','j01',2);

%%3曝！！！！貫貧！！！！！！！！！！

G=addEdge(G,'j47','f44',1);
G=addEdge(G,'j47','f45',1);
G=addEdge(G,'j47','j48',1);

G=addEdge(G,'j48','f46',1);
G=addEdge(G,'j48','f47',1);
G=addEdge(G,'j48','z01',1);

G=addEdge(G,'j49','j50',1);
G=addEdge(G,'j49','f48',1);
G=addEdge(G,'j49','f49',1);

G=addEdge(G,'j50','f50',1);
G=addEdge(G,'j50','z01',1);
G=addEdge(G,'j50','j53',1);

G=addEdge(G,'j53','j56',1);
G=addEdge(G,'j53','j59',1);
G=addEdge(G,'j53','f51',1);

G=addEdge(G,'j56','f52',1);
G=addEdge(G,'j56','f53',1);
G=addEdge(G,'j56','j60',1);

G=addEdge(G,'j60','f55',1);
G=addEdge(G,'j60','f56',1);
G=addEdge(G,'j60','j62',1);

G=addEdge(G,'j62','f60',1);
G=addEdge(G,'j62','f59',1);
G=addEdge(G,'j62','j59',1);
G=addEdge(G,'j62','j60',1);

G=addEdge(G,'j59','f54',1);
G=addEdge(G,'j59','j55',1);
G=addEdge(G,'j59','j58',1);

G=addEdge(G,'j58','j55',1);
G=addEdge(G,'j58','j57',1);
G=addEdge(G,'j58','j61',1);

G=addEdge(G,'j61','f58',1);
G=addEdge(G,'j61','z03',1);
G=addEdge(G,'j61','f57',1);

G=addEdge(G,'j57','z03',1);

G=addEdge(G,'j55','j54',1);
G=addEdge(G,'j55','j53',1);

G=addEdge(G,'j54','z02',1);
G=addEdge(G,'j54','j57',1);

G=addEdge(G,'j51','z02',1);

G=addEdge(G,'j52','z02',1);
G=addEdge(G,'j52','z03',1);
end



