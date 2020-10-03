require "./lib/cipher.rb"

describe "the cipher function" do

    it "moves letters over 2" do

        s = cipher("abc", 2)

        expect(s).to eq("cde")

    end

    it "moves no letters" do

      s = cipher("abc", 0)

      expect(s).to eq("abc")

    end

    it "multiple words" do

      s = cipher("a b c", 1)

      expect(s).to eq("b c d")

    end

    it "handles negative shift" do

      s = cipher("abc", -1)

      expect(s).to eq("zab")

    end

    it "resets after 26" do

      s = cipher("abc", 26)

      expect(s).to eq("abc")

    end

    it "Handles uppercase with lowercase" do

      s = cipher("AbC", 1)

      expect(s).to eq("BcD")

    end

    it "Ignores non-letters" do

      s = cipher("a.b,c!", 1)

      expect(s).to eq("b.c,d!")

    end

end