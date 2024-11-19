
NAME="bench-$(git rev-parse HEAD).log"
cur=`pwd`
cd ../go-ethereum
go test ./... -run -  -bench . -benchmem -timeout 60m -skip \
  BenchmarkSearch128\|BenchmarkSearch512Layers\|BenchmarkSearch1Layer\|BenchmarkPersist\|BenchmarkTraceLogging\|BenchmarkWriteAncientBlocks\|BenchmarkTransactionTrace \
  | tee $cur/benches/$NAME

curl -d "bench done" ntfy.sh/gethbench

cd $cur
