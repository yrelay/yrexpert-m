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

;%QMCARES^INT^1^59547,73876^0
QMCARES ;
 
 
 
 
 
 
 
 
 
 
CONS0 N NUMORD
 S NUMORD=0
 G CONS
CONS1 N NUMORD
 S NUMORD=1
 G CONS
 
CONS S NUMS=NUMS+1
 K VAL D GET2^%TLBAGF3("CASAISIE",NUMS_") ",NUMS,.VAL,.CONTR)
 I VAL="" D SUP^%TLBAGF3("CASAISIE",NUMS) S NUMS=NUMS-1 G:(CONTR="A")!(CONTR="F") ACT^%QMCAITF G CONS
 G:$$^%QMCAREC=1 CONS
 I $$SUIT("Recherche etendue aux mots commencant par "_VAL)=0 G CONS
 G:$$^%QMCARE2=1 CONS
CS I $L(VAL)=1 D SEPAR G CONS
 I $$SUIT("Recherche etendue en supprimant le dernier caractere")=0 G CONS
 S VAL=$E(VAL,1,$L(VAL)-1)
 G:$$^%QMCARE2=1 CONS
 G CS
 
SUIT(MSG) 
 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW(MSG)_" ? ","O")'=1 D SEPAR Q 0
 Q 1
 
FINC 
 D POCLEPA^%VVIDEO
 S AA=(CPT*4)+1
 F %R=AA:1:8 D ADD^%TLBAGF1("CALISTE"," ")
 S AA=CPT-2
 D ADD^%TLBAGF1("CALISTE",$$BLD^%VVIDEO1_$J("",8)_"----> "_$S(AA=-2:"Aucune reponse",(AA=-1)!(AA=0):"Pas d'autres reponses",1:"Il y a "_AA_" autre"_$S(AA=1:"",1:"s")_" reponse"_$S(AA=1:"",1:"s"))_" pour "_VAL_$$NORM^%VVIDEO1)
 S GLO=$$GLOB^%TLBAGF1("CALISTE")
 I AA>0 S @GLIST@("PAGE",$ZP(@GLO@("")))=NUMS
 
 S AA=$$HAUT^%TLBAGF1("CADETAIL")-2
 I ((CPT*4)#AA)=0 G REPO
 F %R=(CPT*4)#AA:1:AA-1 D ADD2^%TLBAGF1("CADETAIL"," ",0)
 
REPO 
 S CPT=1
 D CLEAR^%TLBAGF2("CAREP"),ADD^%TLBAGF1("CAREP",VAL)
 I STOP=0 S MSG=$$^%QZCHW("est inconnu") D ADD^%TLBAGF1("CAREP","    "_MSG),INS("   "_VAL_" "_MSG) G FINCN
 D INS("")
 I '($D(@ECHEC)) S MSG=$$^%QZCHW("est dans tous les repertoires") D ADD^%TLBAGF1("CAREP"," "_MSG),INS("   EN RESUME"),INS(""),INS("   "_VAL_" "_MSG) G FINCN
 I BREP=1 S MSG=$$^%QZCHW("est un repertoire") D ADD^%TLBAGF1("CAREP","   "_MSG) G FINCN
 
 S MSG=$$^%QZCHW("apparait dans le(s) repertoire(s)")_" :" D ADD^%TLBAGF1("CAREP",MSG)
 D INS("   EN RESUME"),INS("")
 D INS("   "_VAL_" "_MSG) S CPT=CPT+1
 S (REP,MSG)="",ARRET=0
 F %R=0:1 S REP=$O(@LISTREP@(REP)) Q:REP=""  I '($D(@ECHEC@(REP))) D AFREP G:ARRET=1 FIN
 S MSG=$P(MSG,",",1,$L(MSG,",")-1) D INS("     "_MSG)
 D ADD^%TLBAGF1("CAREP",MSG)
 G FINCN
AFREP 
 S MSG=MSG_@LISTREP@(REP)_", "
 Q:$L(MSG)'>36
 S MSG=$P(MSG,",",1,$L(MSG,",")-2)
 
 I (CPT+1)=6 S MSG=MSG_"...",ARRET=1
 
 D ADD^%TLBAGF1("CAREP",MSG)
 D INS("     "_MSG) S CPT=CPT+1,MSG=@LISTREP@(REP)_", "
 Q
FINCN 
 S CPT=CPT+1
 F %R=CPT:1:5 D ADD^%TLBAGF1("CAREP","")
 
 
FIN I STOP=1 D SEPAR
 S @GLIST@(NUMS,"FIMP")=NUML-1
 K @(ECHEC) Q STOP
 
INS(MSG) 
 S @IMPR@(NUML)=MSG,NUML=NUML+1 Q
 
INIT 
 S @GLIST@(NUMS,"IMP")=NUML
 S @IMPR@(NUML)=NUMS_") "_VAL_" ?",NUML=NUML+1
 S (BREP,ARRET,CPT)=0
 S ECHEC=$$CONCAS^%QZCHAD(TEMP,"ECHEC") K @(ECHEC)
 D GLOCOP^%QCAGLC(LISTREP,ECHEC)
 S GLO=$$GLOB^%TLBAGF1("CADETAIL"),DEB=$ZP(@GLO@(""))+1,STOP=0
 Q
 
 
SEPAR 
 D INS("")
 D INS($TR($J("",20)," ","*")),INS("")
 Q
 
 
IMP 
 N %I,J,TITR,AD2,CT2,MEN2,GL,F
 S TITR(1)=$$^%QZCHW("BILAN DE CONSULTATION ASSOCIATIVE")
 S MEN2=$$CONCAS^%QZCHAD(TEMP,"MEN2"),GL=$$CONCAS^%QZCHAD(TEMP,"TEMPO")
 K @(MEN2),@(GL)
 S @MEN2="23^10^79"
 S @MEN2@(1)=$$^%QZCHW("Selection")_"^SEL"
 S @MEN2@(1,"COM")=$$^%QZCHW("Impression apres selection")
 S @MEN2@(2)=$$^%QZCHW("Tous")_"^ALL"
 S @MEN2@(2,"COM")=$$^%QZCHW("Impression de tous les resultats")
ACI S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(0,80,22,MEN2,.AD2,.CT2)
 I (CT2="A")!(CT2="F") G E
 G:AD2'="" @AD2 G ACI
E K @(MEN2),@(GL) Q
ALL 
 D IMPR("","") G E
SEL 
 S AA=$$CHOI^%QMCAITF("CASAISIE",1,"Pour imprimer, selectionner une question par [RETURN]") G:AA="" E
 S AA=$P(@GLOBAL@(AA),")",1),C=$$CONCAT^%QZCHAD(GLIST,$$S1^%QZCHAD(AA)_",""IMP"""),F=$$CONCAT^%QZCHAD(GLIST,$$S1^%QZCHAD(AA)_",""FIMP""")
 D IMPR(@C,@F)
 G SEL
 
IMPR(L,F) 
 D POCLEPA^%VVIDEO
 Q:$$MES^%VZEOUI($$^%QZCHW("Confirmez-vous l'impression")_" ? ","O")'=1
 D MSG^%VZEATT($$^%QZCHW("Impression en cours"))
 I L="" D IMPT^%VPRINT(IMPR,"TITR") Q
 K @(GL) S J=1 F %I=L:1:F S @GL@(J)=@IMPR@(%I),J=J+1
 D IMPT^%VPRINT(GL,"TITR"),^%VZEAVT($$^%QZCHW("Impression terminee"))
 Q

