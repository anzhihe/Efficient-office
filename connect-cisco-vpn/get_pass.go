package main

import (
    "encoding/base32"
    "flag"
    "fmt"
    "github.com/hgfischer/go-otp"
    "strings"
)

const (
    SECRET = "xxxx"  //此处修改为google auth token
)

var (
    secret   = flag.String("secret", "password", "Secret key")
    isBase32 = flag.Bool("base32", true, "If true, the secret is interpreted as a Base32 string")
    length   = flag.Uint("length", otp.DefaultLength, "OTP length")
    period   = flag.Uint("period", otp.DefaultPeriod, "Period in seconds")
    counter  = flag.Uint64("counter", 0, "Counter")
    auth     = flag.String("auth", "relay", "login platform [relay|vpn]")
)

func isGoogleAuthenticatorCompatible(base32Secret string) bool {
    cleaned := strings.Replace(base32Secret, "=", "", -1)
    cleaned = strings.Replace(cleaned, " ", "", -1)
    return len(cleaned) == 16
}

func GetToken(secret *string) string {
    key := *secret
    if !*isBase32 {
        key = base32.StdEncoding.EncodeToString([]byte(*secret))
    }
    key = strings.ToUpper(key)
    if !isGoogleAuthenticatorCompatible(key) {
    }
    totp := &otp.TOTP{
        Secret:         key,
        Length:         uint8(*length),
        Period:         uint8(*period),
        IsBase32Secret: true,
    }
    return fmt.Sprintf("%v", totp.Get())
}

func main() {
    flag.Parse()
    *secret = SECRET
    //fmt.Printf("Code: ")
    fmt.Println(GetToken(secret))
}
