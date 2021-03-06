require 'goby'

RSpec.describe Weapon do

  before (:all) do
    @weapon = Weapon.new
    @entity = Entity.new
  end

  context "constructor" do
    it "has the correct default parameters" do
      expect(@weapon.name).to eq "Weapon"
      expect(@weapon.price).to eq 0
      expect(@weapon.consumable).to eq false
      expect(@weapon.disposable).to eq true
      expect(@weapon.type).to eq :weapon
    end

    it "correctly assigns custom parameters" do
      pencil = Weapon.new(name: "Pencil",
                           price: 20,
                           consumable: true,
                           disposable: false,
                           stat_change: {attack: 2, defense: 2})
      expect(pencil.name).to eq "Pencil"
      expect(pencil.price).to eq 20
      expect(pencil.consumable).to eq true
      expect(pencil.disposable).to eq false
      expect(pencil.stat_change[:attack]).to eq 2
      expect(pencil.stat_change[:defense]).to eq 2
      # Cannot be overwritten.
      expect(pencil.type).to eq :weapon
    end
  end

  context "use" do
    it "should print an appropriate message for how to equip" do
      expect { @weapon.use(@entity, @entity) }.to output(
        "Type 'equip Weapon' to equip this item.\n\n"
      ).to_stdout
    end
  end

end
