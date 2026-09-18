def analyze_job_description(text: str) -> dict:
    text_lower = text.lower()
    score = 0
    detected_red_flags = []
    detected_positive_signals = []

    # Heuristic weights for suspicious signals
    red_flag_rules = {
        "registration fee": 25,
        "processing fee": 20,
        "security deposit": 25,
        "training fee": 25,
        "laptop deposit": 30,
        "pay to apply": 30,
        "guaranteed internship": 15,
        "guaranteed job": 15,
        "otp": 25,
        "bank details": 15,
        "aadhaar": 10,
        "task based": 15,
        "join telegram channel": 10,
        "whatsapp me": 10,
        "limited seats": 5,
        "urgent": 5
    }

    positive_rules = [
        "official careers page",
        "no payment required",
        "no registration fee"
    ]

    # Scan for red flags
    for phrase, points in red_flag_rules.items():
        if phrase in text_lower:
            score += points
            detected_red_flags.append(f"{phrase.title()} requested/mentioned")

    # Scan for positive signals
    for phrase in positive_rules:
        if phrase in text_lower:
            detected_positive_signals.append(phrase.title())

    # Cap score at 100
    score = min(score, 100)

    # Determine risk level and recommendation
    if score >= 60:
        risk_level = "HIGH"
        recommendation = "Verify the employer independently before proceeding. Do not make payments or share sensitive information."
    elif score >= 30:
        risk_level = "MEDIUM"
        recommendation = "Proceed with caution. Double-check the company's official domain and credentials."
    else:
        risk_level = "LOW"
        recommendation = "This opportunity appears standard. Always remain vigilant before sharing data."

    return {
        "score": score,
        "risk": risk_level,
        "red_flags": detected_red_flags,
        "positive_signals": detected_positive_signals,
        "recommendation": recommendation
    }

# Local test runner
if __name__ == "__main__":
    sample = "Pay 999 registration fee to secure your guaranteed internship. Send bank details and OTP. Limited seats!"
    result = analyze_job_description(sample)
    print("--- Test Output ---")
    print(f"Risk Level: {result['risk']}")
    print(f"Risk Score: {result['score']}/100")
    print(f"Red Flags: {result['red_flags']}")