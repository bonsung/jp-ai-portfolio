-- ══════════════════════════════════════════════════════
--  JP AI Journey — entries 테이블 RLS 설정
--  Supabase Dashboard > SQL Editor 에서 실행
-- ══════════════════════════════════════════════════════

-- 1. RLS 활성화
ALTER TABLE entries ENABLE ROW LEVEL SECURITY;

-- 2. 공개 조회 허용 (포트폴리오는 누구나 볼 수 있음)
CREATE POLICY "public_read_entries"
  ON entries
  FOR SELECT
  TO anon, authenticated
  USING (true);

-- 3. anon/authenticated 의 직접 쓰기 차단
--    (INSERT/UPDATE/DELETE 정책을 만들지 않으면 기본 deny)
--    Edge Function 은 service_role 키를 사용하므로 RLS 우회 가능

-- ══ 적용 확인 ══
-- 아래 쿼리로 정책 목록 확인 가능:
-- SELECT policyname, cmd, roles FROM pg_policies WHERE tablename = 'entries';
