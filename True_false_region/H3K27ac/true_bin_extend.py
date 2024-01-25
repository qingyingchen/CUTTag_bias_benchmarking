inf = open("H3K27ac_sicerPeak_nearHighExp1kb.bed")
outf_ext200 = open("H3K27ac_sicerPeak_nearHighExp1kb_ext200bp.bed",'w')
outf_ext300 = open("H3K27ac_sicerPeak_nearHighExp1kb_ext300bp.bed",'w')
outf_ext400 = open("H3K27ac_sicerPeak_nearHighExp1kb_ext400bp.bed",'w')
outf_ext500 = open("H3K27ac_sicerPeak_nearHighExp1kb_ext500bp.bed",'w')
outf_ext600 = open("H3K27ac_sicerPeak_nearHighExp1kb_ext600bp.bed",'w')
outf_ext700 = open("H3K27ac_sicerPeak_nearHighExp1kb_ext700bp.bed",'w')
outf_ext800 = open("H3K27ac_sicerPeak_nearHighExp1kb_ext800bp.bed",'w')
outf_ext900 = open("H3K27ac_sicerPeak_nearHighExp1kb_ext900bp.bed",'w')

for line in inf:
	ll = line.split()
	chrm = ll[0]
	start = int(ll[1])
	end = int(ll[2])
	binname = ll[3]
	bincenter = int((start + end)/2)
	outf_ext200.write("\t".join(map(str, [chrm, bincenter - 200, bincenter + 200, binname]))+"\n")
	outf_ext300.write("\t".join(map(str, [chrm, bincenter - 300, bincenter + 300, binname]))+"\n")
	outf_ext400.write("\t".join(map(str, [chrm, bincenter - 400, bincenter + 400, binname]))+"\n")
	outf_ext500.write("\t".join(map(str, [chrm, bincenter - 500, bincenter + 500, binname]))+"\n")
	outf_ext600.write("\t".join(map(str, [chrm, bincenter - 600, bincenter + 600, binname]))+"\n")
	outf_ext700.write("\t".join(map(str, [chrm, bincenter - 700, bincenter + 700, binname]))+"\n")
	outf_ext800.write("\t".join(map(str, [chrm, bincenter - 800, bincenter + 800, binname]))+"\n")
	outf_ext900.write("\t".join(map(str, [chrm, bincenter - 900, bincenter + 900, binname]))+"\n")

outf_ext200.close() 
outf_ext300.close() 
outf_ext400.close() 
outf_ext500.close() 
outf_ext600.close() 
outf_ext700.close() 
outf_ext800.close() 
outf_ext900.close() 
inf.close()


