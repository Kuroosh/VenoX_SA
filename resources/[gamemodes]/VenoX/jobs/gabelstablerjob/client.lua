local kisten 
local kistenTyp = {}
local kisteJob = {}

local function loadKisten()
	kisten = {
		createObject(1558, 1065.5999755859, 1852.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1854, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1855.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1856.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1857.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1858.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1859.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.599609375, 1860.599609375, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.599609375, 1861.69921875, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1862.8000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1863.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1865, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1866.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1852.9000244141, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1854, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1855.0999755859, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1856.1999511719, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1857.3000488281, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1858.4000244141, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1859.5, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1860.5999755859, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1861.6999511719, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1862.8000488281, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1863.9000244141, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1865, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5999755859, 1866.0999755859, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1867.8000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1868.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1870, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1871.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1872.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1873.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1874.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1875.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1876.5999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1877.6999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.3994140625, 1878.7998046875, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1879.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1881, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1882.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1867.8000488281, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1868.9000244141, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1870, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1871.0999755859, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1872.1999511719, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1873.3000488281, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1874.4000244141, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1875.5, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1876.5999755859, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1877.6999511719, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1878.8000488281, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1879.9000244141, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.4000244141, 1881, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1075.3994140625, 1882.099609375, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1105.0999755859, 1843.9000244141, 10.39999961853, 0, 0, 90), 
        createObject(1558, 1104, 1843.9000244141, 10.39999961853, 0, 0, 90), 
        createObject(1558, 1102.9000244141, 1843.9000244141, 10.39999961853, 0, 0, 90), 
        createObject(1558, 1101.8000488281, 1843.9000244141, 10.39999961853, 0, 0, 90), 
        createObject(1558, 1100.6999511719, 1843.9000244141, 10.39999961853, 0, 0, 90), 
        createObject(1558, 1099.5999755859, 1843.9000244141, 10.39999961853, 0, 0, 90), 
        createObject(1558, 1098.5, 1843.9000244141, 10.39999961853, 0, 0, 90), 
        createObject(1558, 1097.4000244141, 1843.9000244141, 10.39999961853, 0, 0, 90), 
        createObject(1558, 1096.3000488281, 1843.9000244141, 10.39999961853, 0, 0, 90), 
        createObject(1558, 1105.0999755859, 1843.9000244141, 11.439999580383, 0, 0, 90), 
        createObject(1558, 1104, 1843.9000244141, 11.439999580383, 0, 0, 90), 
        createObject(1558, 1102.9000244141, 1843.9000244141, 11.439999580383, 0, 0, 90), 
        createObject(1558, 1101.8000488281, 1843.9000244141, 11.439999580383, 0, 0, 90), 
        createObject(1558, 1100.6999511719, 1843.9000244141, 11.439999580383, 0, 0, 90), 
        createObject(1558, 1099.5999755859, 1843.9000244141, 11.439999580383, 0, 0, 90), 
        createObject(1558, 1098.5, 1843.9000244141, 11.439999580383, 0, 0, 90), 
        createObject(1558, 1097.4000244141, 1843.9000244141, 11.439999580383, 0, 0, 90), 
        createObject(1558, 1096.3000488281, 1843.9000244141, 11.439999580383, 0, 0, 90), 
        createObject(1558, 1065.5, 1882.8000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5, 1883.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5, 1885, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5, 1886.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5, 1887.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1065.5, 1882.8000488281, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5, 1883.9000244141, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5, 1885, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5, 1886.0999755859, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1065.5, 1887.1999511719, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1921, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1922.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1923.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1924.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1925.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1926.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1927.5999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1928.6999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1929.8000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1930.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1930.4000244141, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1929.1999511719, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1928.0999755859, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1927, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1925.8000488281, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1924.5999755859, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1922.5999755859, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1151.8000488281, 1921.4000244141, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1085.9000244141, 1890.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1085.9000244141, 1891.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1085.9000244141, 1890.9000244141, 11.439999580383, 0, 0, 0), 
        createObject(1558, 1085.8000488281, 1887.8000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1113.6999511719, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1114.8000488281, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1115.9000244141, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1117, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1118.0999755859, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1119.1999511719, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1120.3000488281, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1121.4000244141, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1122.5, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1123.5999755859, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1124.6999511719, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1125.8000488281, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1126.9000244141, 1892.0999755859, 10.39999961853, 0, 0, 270), 
        createObject(1558, 1048.4000244141, 1844, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1048.4000244141, 1845.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1048.4000244141, 1846.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1048.4000244141, 1847.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1048.4000244141, 1848.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1048.4000244141, 1849.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1048.4000244141, 1850.5999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1049.9000244141, 1844, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1049.9000244141, 1845.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1049.9000244141, 1846.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1049.9000244141, 1847.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1049.9000244141, 1848.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1049.9000244141, 1849.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1049.9000244141, 1850.5999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1051.3000488281, 1844, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1051.3000488281, 1845.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1051.3000488281, 1846.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1051.3000488281, 1847.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1051.3000488281, 1848.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1051.3000488281, 1849.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1051.3000488281, 1850.5999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1052.5, 1844, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1052.5, 1845.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1052.5, 1846.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1052.5, 1847.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1052.5, 1848.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1052.5, 1849.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1052.5, 1850.5999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1053.9000244141, 1844, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1053.9000244141, 1845.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1053.9000244141, 1846.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1053.9000244141, 1847.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1053.9000244141, 1848.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1053.9000244141, 1849.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1053.9000244141, 1850.5999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1128.1999511719, 1845.0999755859, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1128.1999511719, 1846.1999511719, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1128.1999511719, 1847.3000488281, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1128.1999511719, 1848.4000244141, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1128.1999511719, 1849.5, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1128.1999511719, 1850.5999755859, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1128.1999511719, 1851.6999511719, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1128.1999511719, 1852.8000488281, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1128.1999511719, 1853.9000244141, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1128.1999511719, 1855, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1127, 1845.0999755859, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1127, 1846.1999511719, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1127, 1847.3000488281, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1127, 1848.4000244141, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1127, 1849.5, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1127, 1850.5999755859, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1127, 1851.6999511719, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1127, 1852.8000488281, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1127, 1853.9000244141, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1127, 1855, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1125.9000244141, 1845.0999755859, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1125.9000244141, 1847.3000488281, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1125.9000244141, 1848.4000244141, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1125.9000244141, 1849.5, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1125.9000244141, 1850.5999755859, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1125.9000244141, 1851.6999511719, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1125.9000244141, 1852.8000488281, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1125.9000244141, 1853.9000244141, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1125.9000244141, 1855, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1124.8000488281, 1855, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1124.8000488281, 1853.9000244141, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1124.8000488281, 1852.8000488281, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1124.8000488281, 1851.6999511719, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1124.8000488281, 1850.5999755859, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1124.8000488281, 1849.5, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1124.8000488281, 1848.4000244141, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1124.8000488281, 1847.3000488281, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1124.8000488281, 1846.1999511719, 10.300000190735, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1867.8000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1868.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1870, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1871.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1872.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1873.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1874.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1875.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1876.5999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1877.6999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1878.8000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1879.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1881, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1076.5999755859, 1882.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.8000488281, 1882.8000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.8000488281, 1883.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.8000488281, 1885, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.8000488281, 1886.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.8000488281, 1887.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1852.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1854, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1855.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1856.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1857.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1858.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1859.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1860.5999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1861.6999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1862.8000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1863.9000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1865, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1066.9000244141, 1866.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1055.3000488281, 1844, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1055.3000488281, 1845.0999755859, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1055.3000488281, 1846.1999511719, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1055.3000488281, 1847.3000488281, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1055.3000488281, 1848.4000244141, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1055.3000488281, 1849.5, 10.39999961853, 0, 0, 0), 
        createObject(1558, 1055.3000488281, 1850.6999511719, 10.39999961853, 0, 0, 0), 

		
	}
	for i = 1, #kisten, 1 do
		if(i > 1) then
			kistenTyp[kisten[i]] = 1
		end
		if(i > 150) then
			kistenTyp[kisten[i]] = 2
		end
		if(i > 300) then
			kistenTyp[kisten[i]] = 3
		end
		kisteJob[kisten[i]] = true
	end
end


local function destroyKisten()
	for index, ob in pairs(kisten) do
		if(isElement(ob)) then
			destroyElement(ob)
		end
	end
end

loadKisten()

--[[local ped = {}

ped[1] = createPed(16, -2315.2644042969, -28.759546279907, 35.3203125, 179.47991943359)
ped[2] = createPed(153, -2315.2709960938, -29.655469894409, 35.3203125, 0)
setPedAnimation(ped[2], "ped" , "IDLE_chat", -1, true, false, false)
ped[3] = createPed(16, -2296.2634277344, -24.181083679199, 35.3203125, 224.89024353027)
ped[4] = createPed(260, -2295.4924316406, -24.771991729736, 35.3203125, 47.08349609375)
setPedAnimation(ped[4], "ped" , "IDLE_chat", -1, true, false, false)
ped[5] = createPed(153, -2285.9399414063, -4.9342861175537, 39.3203125, 321.77301025391)
ped[6] = createPed(260, -2281.6096191406, 0.12067197263241, 38.546562194824, 134.42126464844)
setPedAnimation(ped[6], "ped" , "IDLE_chat", -1, true, false, false)
ped[7] = createPed(27, -2297.1623535156, 40.868106842041, 35.3125, 272.14431762695)
setPedAnimation(ped[7], "ped" , "phone_talk", -1, true, false, false)
ped[8] = createPed(260, -2305.0192871094, 37.097183227539, 35.3203125, 125.35797119141)
ped[9] = createPed(153, -2307.0698242188, 35.673194885254, 35.3203125, 307.55133056641)
setPedAnimation(ped[9], "ped" , "IDLE_chat", -1, true, false, false)
ped[10] = createPed(27, -2309.6618652344, 21.574289321899, 35.3125, 178.62512207031)
setPedAnimation(ped[10], "bomber", "BOM_Plant_Loop", -1, true, false, false)]]--



-- NPC --
--[[local npcvar = {}
local npcFUNC = {}
npcvar[1] = 0

ped[11] = createPed(260, -2306.9487304688, -6.3593606948853, 35.3203125, 270.16625976563)
setPedAnimation(ped[11], "ped", "WALK_civi", -1, true, true, false)



npcFUNC["ped11walk1"] = function()
	setPedAnimation(ped[11])
	setTimer(function()
		setPedRotation(ped[11], 180)
		setPedAnimation(ped[11], "ped", "WALK_civi", -1, true, true, false)
	end, 1000, 1)
	setTimer(npcFUNC["ped11walk2"], 9000, 1)
end

npcFUNC["ped11walk2"] = function()
	setPedAnimation(ped[11])
	setTimer(function()
		setPedRotation(ped[11], 0)
		setPedAnimation(ped[11], "ped", "WALK_civi", -1, true, true, false)
	end, 1000, 1)
	setTimer(npcFUNC["ped11walk3"], 9000, 1)
end

npcFUNC["ped11walk3"] = function()
	setPedAnimation(ped[11])
	setTimer(function()
		setPedRotation(ped[11], 90)
		setPedAnimation(ped[11], "ped", "WALK_civi", -1, true, true, false)
	end, 1000, 1)
	setTimer(npcFUNC["ped11walk4"], 8000, 1)
end

npcFUNC["ped11walk4"] = function ()
setElementPosition(ped[11], -2306.9487304688, -6.3593606948853, 35.3203125)
	setPedAnimation(ped[11])
	setTimer(function()
		setPedRotation(ped[11], 270)
		setPedAnimation(ped[11], "ped", "WALK_civi", -1, true, true, false)
	end, 1000, 1)
	setTimer(npcFUNC["ped11walk1"], 8000, 1)
end

setTimer(npcFUNC["ped11walk1"], 8000, 1)


ped[12] = createPed(16, -2285.9528808594, 4.3300638198853, 35.3203125, 91.349639892578)

npcFUNC["ped12walk1"] = function()
	setPedAnimation(ped[12])
	setElementPosition(ped[12], -2285.9528808594, 4.3300638198853, 35.3203125)
	setTimer(function()
		setPedRotation(ped[12], 90)
		setPedAnimation(ped[12], "ped", "WALK_civi", -1, true, true, false)
	end, 1000, 1)
	setTimer(npcFUNC["ped12walk2"], 15000, 1)
end

npcFUNC["ped12walk2"] = function()
	setPedAnimation(ped[12])
	setTimer(function()
		setPedRotation(ped[12], 270)
		setPedAnimation(ped[12], "ped", "WALK_civi", -1, true, true, false)
	end, 1000, 1)
	setTimer(npcFUNC["ped12walk1"], 15000, 1)
end

npcFUNC["ped12walk1"]()

ped[13] = createPed(27, -2308.3999023438, -32.601425170898, 35.3203125, 182.072265625)

npcFUNC["ped13walk1"] = function()
	setPedAnimation(ped[13])
	setElementPosition(ped[13],-2308.3999023438, -32.601425170898, 35.3203125)
	setTimer(function()
		setPedRotation(ped[13], 180)
		setPedAnimation(ped[13], "ped", "WALK_civi", -1, true, true, false)
	end, 1000, 1)
	setTimer(npcFUNC["ped13walk2"], 15000, 1)
end

npcFUNC["ped13walk2"] = function()
	setPedAnimation(ped[13])
	setTimer(function()
		setPedRotation(ped[13], 0)
		setPedAnimation(ped[13], "ped", "WALK_civi", -1, true, true, false)
	end, 1000, 1)
	setTimer(npcFUNC["ped13walk1"], 15000, 1)
end

npcFUNC["ped13walk1"]()

ped[14] = createPed(153, -2332.9343261719, -9.2196617126465, 35.853561401367, 273.89276123047)
setPedAnimation(ped[14], "ped" , "IDLE_chat", -1, true, false, false)

for i = 1, #ped, 1 do
	addEventHandler("onClientPedDamage", ped[i], cancelEvent)
end

local infom = createMarker(-2332.0561523438, -9.1659812927246, 35.053561401367, "cylinder", 1.0, 0, 255, 0, 20)
local outputchatboxdone = false

addEventHandler("onClientMarkerHit", infom, function(ele)
	if(ele ~= localPlayer) then return end
	if(outputchatboxdone == true) then return end
	outputchatboxdone = true
	setTimer(function() outputchatboxdone = false end, 5*60*1000, 1)
	outputChatBox("Manager sagt: Hier wird gerade ein neues Depot angebaut. Kann warscheinlich noch etwas dauern.", 255, 255, 255)
end)]]--

local pfeil = {}
local abstellcol = {}
local abstellmarker = {}

local Guivar = 0
local lohn = 25 -- DER LOHN (Muesste passen, ich hab mich mit Tobi beraten:D)
local doing = false
local abgeliefert = 0
local abgelieferte_kiste = {}
addEvent("onClientGabelstablerJobHit", true)
addEvent("onClientGabelstablerJobQuit", true)

local function load_gabelstablerjob()
	doing = true
	for index, object in pairs(kisten) do
		local r, g, b = 0, 255, 0
		local i = kistenTyp[object]
		if(i == 1) then r, g, b = 0, 255, 0 end
		if(i == 2) then r, g, b = 255, 255, 0 end
		if(i == 3) then r, g, b = 255, 0, 0 end
		pfeil[object] = createMarker(0, 0, 0, "arrow", 0.5, r, g, b)
		attachElements(pfeil[object], object, 0, 0, 1)
	end
	
	abstellcol[1] = createColSphere(1109, 1894.5, 11.60000038147, 2)
	abstellmarker[1] = createMarker(1109, 1894.5, 11.60000038147, "corona", 2.0, 0, 255, 0, 100)
	
	abstellcol[2] = createColSphere(1109, 1909.5, 11.60000038147, 2)
	abstellmarker[2] = createMarker(1109, 1909.5, 11.60000038147, "corona", 2.0, 0, 255, 0, 100)
	
	abstellcol[3] = createColSphere(1109, 1324, 11.60000038147, 2)
	abstellmarker[3] = createMarker(1109, 1324, 11.60000038147, "corona", 2.0, 0, 255, 0, 100)
	
	abstellcol[4] = createColSphere(1132.0999755859, 1913.5, 11.60000038147, 2)
	abstellmarker[4] = createMarker(1132.0999755859, 1913.5, 11.60000038147, "corona", 2.0, 0, 255, 0, 100)
	
	abstellcol[5] = createColSphere(1132.5, 1898.5, 11.60000038147, 2)
	abstellmarker[5] = createMarker(1132.5, 1898.5, 11.60000038147, "corona", 2.0, 0, 255, 0, 100)
	for i = 1, #abstellcol, 1 do
		addEventHandler("onClientColShapeHit", abstellcol[i], function(hitElement, dim)
			if(dim == true) and kisteJob[hitElement] then
				if(abgelieferte_kiste[hitElement]) then return end
				local x, y, z = getElementPosition(localPlayer)
				local x2, y2, z2 = getElementPosition(hitElement)
				if(getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) > 3.5) then return end
				local i = kistenTyp[hitElement]
				local lohn2 = 0
				if(i == 3) then lohn2 = 5 end
				if(i == 2) then lohn2 = 0 end
				if(i == 1) then lohn2 = 5 end
				abgelieferte_kiste[hitElement] = hitElement
				vanishElement(hitElement)
				vanishElement(pfeil[hitElement])
				-- outputChatBox("Kiste abgeliefert!", 255, 255, 0)
				outputChatBox("Kiste abgeliefert, du erhälst "..lohn+lohn2.."$!", 255, 255, 0)
				abgeliefert = abgeliefert+1
				triggerServerEvent("onGabelstablerJobAbgeliefert", localPlayer, lohn2)
			end
		end)
	end
end


local function quit_gabelstablerjob()
	for index, p in pairs(pfeil) do
		if(isElement(p)) then
			destroyElement(p)
		end
	end
	for i = 1, #abstellcol, 1 do
		destroyElement(abstellcol[i])
		destroyElement(abstellmarker[i])
	end
	abgeliefert = 0
	doing = false
	abgelieferte_kiste = nil
	abgelieferte_kiste = {}
	destroyKisten()
	loadKisten()
end

addEventHandler("onClientGabelstablerJobQuit", getLocalPlayer(), quit_gabelstablerjob)


addEventHandler("onClientGabelstablerJobHit", getLocalPlayer(), function()
	if(Guivar == 1) then return end
	if(doing == true) then return end
	Guivar = 1
	showCursor(true)
	local X, Y, Width, Height = getMiddleGuiPosition(380,130)
	local Fenster = guiCreateWindow(X, Y, Width, Height, "Gabelstablerjob",false)
	setElementClicked ( true )
	local Label = guiCreateLabel(8,22,356,66,"Möchtest du den Gabelstablerjob starten?\nLohn pro Kiste: $"..lohn,false,Fenster)
	guiLabelSetVerticalAlign(Label,"center")
	guiLabelSetHorizontalAlign(Label,"center",false)
	guiSetFont(Label,"default-bold-small")
	local Knopf1 = guiCreateButton(10,90,111,27,"Ja, bitte!",false,Fenster)
	local Knopf2 = guiCreateButton(126,90,111,27,"Nein danke.",false,Fenster)
	
	-- Ja bitte
	addEventHandler("onClientGUIClick", Knopf1, function()
		
		Guivar = 0
		setElementClicked ( false )
		showCursor(false)
		destroyElement(Fenster)
		triggerServerEvent("onGabelstablerJobStart", localPlayer)
		load_gabelstablerjob()
	end, false)
	
	-- Nein danke --
	addEventHandler("onClientGUIClick", Knopf2, function()
		Guivar = 0
		setElementClicked ( false )
		showCursor(false)
		destroyElement(Fenster)
	end, false)
end)


-- FUNKTIONEN NICHT RAUSNEHMEN --

local v_e_doing = {}

function vanishElement(theElement)
	if(v_e_doing[theElement] == true) then return end
	v_e_doing[theElement] = true
	for i = 1, 25 do
		setTimer ( setElementAlpha, 100 * i, 1, theElement, 255 / 25 * ( 25 - i ) )
	end
	setTimer ( destroyElement, 2500, 1, theElement )
end

function getMiddleGuiPosition(lol, lol2)

	local sWidth, sHeight = guiGetScreenSize()
 
    local Width,Height = lol, lol2
    local X = (sWidth/2) - (Width/2)
    local Y = (sHeight/2) - (Height/2)
	
	return X, Y, Width, Height
end