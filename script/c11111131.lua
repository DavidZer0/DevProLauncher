--Dark Wave
function c11111131.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetTarget(c11111131.target)
	e1:SetOperation(c11111131.activate)
	c:RegisterEffect(e1)
end
function c11111131.filter(c)
	local lv=c:GetLevel()
	return c:IsFaceup() and lv>0 and not c:IsType(TYPE_TUNER) 
end
function c11111131.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and c11111131.filter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c11111131.filter,tp,LOCATION_MZONE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	Duel.SelectTarget(tp,c11111131.filter,tp,LOCATION_MZONE,0,1,1,nil)
end
function c11111131.activate(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) and tc:IsFaceup() then
		tc:RegisterFlagEffect(11111131,RESET_EVENT+0x1fe0000+RESET_PHASE+RESET_END,0,1) 	
	end
end