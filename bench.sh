
cur=`pwd`
cd ../go-ethereum
NAME="bench-$(git rev-parse HEAD).log"

curl -d "starting bench $NAME" ntfy.sh/gethbench

go test ./... -run -  -bench . -benchmem -timeout 60m -skip \
  BenchmarkSearch128\|BenchmarkSearch512Layers\|BenchmarkSearch1Layer\|BenchmarkPersist\|BenchmarkTraceLogging\|BenchmarkWriteAncientBlocks\|BenchmarkTransactionTrace\|BenchmarkTracerStepVsCallFrame \
  | tee $cur/benches/$NAME

curl -d "bench done" ntfy.sh/gethbench

cd $cur
