#[tokio::test]
async fn test_text_to_speech() {
    let result = crate::say::text_to_speech("test").await;
    assert!(result.is_ok());
}
