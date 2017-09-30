;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QCSMIS^INT^1^59547,73875^0
ZMIS(TB) 
A W ?28,"Prompt",?38,"Other OPEN",?50,"Alt",! S MNE=""
 W "MNE",?8,"Dev",?13,"Type",?19,"Subtype",?29,"code",?38,"parameters",?50,"dev",?56,"Location",!,!
B S MNE=$O(@TB@(MNE)) Q:MNE=""
 W !,MNE G:MNE="?" HELP F I=1:1:7 S Z(I)=""
 I $D(^%IS(MNE,1)) S A=^(1) F I=1:1:7 S Z(I)=$P(A,"^",I)
 
 I (MNE="DELETE")!(MNE="DEL") D DELETE G B
 G DEV:MNE'["?" S A=$P(MNE,"?",1) D LOOK W:X="" " [no such device on record]",! G B
DEV S DEV=MNE W ?8,DEV S:DEV="" DEV=Z(1) S:DEV="" DEV=MNE
DEVCHK 
TYPE S TYPE="TRM" W ?13,TYPE S:TYPE="" TYPE=Z(2) F I=1:1:4 G SUB:$P("TRM^MT^SPL^OTH","^",I)=TYPE
 W " [""TRM"", ""MT"", ""SPL"", or ""OTH""]",! G TYPE
SUB S (SUB,PROMPT,SEC,OTH,ALT)="" G PROMPT:((TYPE'="TRM")&(TYPE'="SPL"))&(TYPE'="MT")
 S SUB="C-VT100" W ?19,SUB S:SUB="" SUB=Z(3) G PROMPT:SUB="" I '($D(^%IS(0,"SUB",SUB))) W " [must be a defined subtype (or press RETURN)]",! G SUB
PROMPT S PROMPT="" W ?29,PROMPT S PROMPT=$S(PROMPT="":Z(4),(PROMPT=0)!(PROMPT="DEL"):"",1:PROMPT) I PROMPT'="",PROMPT'=1,PROMPT'=2 W " [0, 1 or 2 (or press RETURN)]",! G PROMPT
 G OTH:TYPE'="TRM"
SEC 
ALT S ALT="" I ALT="" S ALT=Z(7) G LOC
 I ALT="DEL" S ALT="" G LOC
 I '($D(^%IS(ALT,0))) W " [invalid alternate device]",! G ALT
 G LOC
OTH S OTH="" W ?38,OTH S OTH=$S(OTH="":Z(6),OTH="DEL":"",1:OTH) I OTH[":",OTH'?1"(".E1")" W " [must surround with () if there is a "":""]",! G OTH
LOC S LOC="" I LOC="",$D(^%IS(MNE,0)) S LOC=^(0)
 I (LOC="DEL")!(LOC="DELETE") S LOC=""
SET S ^%IS(MNE,0)=LOC,X=DEV_"^"_TYPE_"^"_SUB_"^"_PROMPT_"^"_SEC_"^"_OTH_"^"_ALT
 S ^(1)=X I MNE'=DEV,'($D(^%IS(DEV))) S ^(DEV,0)=LOC,^(1)=X
 G B
 Q
DELETE W "  Delete device: " R A G B:A="" D LOOK W:X="" " [no such device on record]" W ! G:X="" B
 W "Is this the device to be deleted?" D NY W ! Q:'($T)
 K ^%IS(A) S MNE=A D DELALT I (+(A))=A S B=0 F I=1:1 S B=$N(^%IS(B)) Q:B<0  I B'=(+(B)),$D(^(B,1)) S C=^(1) I (+(C))=A K ^%IS(B) S MNE=B D DELALT
 Q
DELALT S D=0 F K=1:1 S D=$N(^%IS(D)) Q:D<0  I $D(^(D,1)),$P(^(1),"^",7)=MNE S ^(1)=$P(^(1),"^",1,6)_"^"
 Q
LOOK S X="" I A]"",$D(^%IS(A,1)) S X=^(1) W !,A F J=1,2,3,4,6,7,8 W ?$P("8^13^19^29^^38^50^56","^",J)-1," ",$P(X,"^",J) W:J=8 ^(0),!
 Q
 
NY N X,A S X=$X
NYQ W "  No=> " R A S A=$F("NnYy",$E(A)) I '(A) W !,?X G NYQ
 I A'<4
 Q
HELP 
 W !,"This utility is used to add or edit the %IS parameters for devices.",!
 W "Specify the device # or mnemonic for device; ""TRM"", ""MT"", ""SPL"",or ""OTH""",!
 W "for type; device subtype for terminals or spool.",!
 W "You may leave the prompt code empty or select one of the following codes:",!
 W ?5,"1   When %IS is called and this device is your current device, the",!
 W ?9,"device question is suppressed and your current device is selected.",!
 W ?5,"2   When %IS is called and this device is selected, the ""Right margin""",!
 W ?9,"or ""Parameter"" question is suppressed.",!
 W "You can specify additional open parameters for non-terminal devices.",!,!
 W "To examine a device, put a ? at the end of the device name, e.g., ""TT?"".",!
 W "To delete a device, type ""DEL"" in the ""MNE"" field, and the computer will",!
 W "ask what device should be deleted.",!,!
 W "When editing a device, unanswered questions retain their previous values.",!
 W "To delete a value, type ""DEL"".",!,!
 G A

