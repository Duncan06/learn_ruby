require "cipher"

describe "the cipher function" do
    it "ciphers " do
        s = cipher("abc", 2)
      expect(s).to eq("cde")
    end
end