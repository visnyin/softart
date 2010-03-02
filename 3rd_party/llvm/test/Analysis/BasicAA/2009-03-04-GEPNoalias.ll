; RUN: llvm-as < %s | opt -basicaa -gvn | llvm-dis | grep load

declare noalias i32* @noalias()

define i32 @test(i32 %x) {
  %a = call i32* @noalias()
  store i32 1, i32* %a
  %b = getelementptr i32* %a, i32 %x
  store i32 2, i32* %b

  %c = load i32* %a
  ret i32 %c
}