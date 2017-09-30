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

;%QMCPOZ^INT^1^59547,73876^0
%QMCPOZ ;
 
 
MVS(QUI1,WH,QUI,BASE,IND,ATT,VAL,MODE) 
 I MODE'=3 D MVS^%QMCPZ(WH,QUI,BASE,IND,ATT,VAL) Q
 
 I $$TYPE^%QSGEST9(BASE,ATT)'=0 Q
 N OR,I
 S OR=$O(@VAL@(""))
 F I=0:0 Q:OR=""  D:($D(@VAL@(OR))#10)=1 PA^%QMCPOZ(QUI1,WH,QUI,BASE,IND,ATT,@VAL@(OR),OR,MODE) S OR=$O(@VAL@(OR))
 Q
 
PA(QUI1,WH,QUI,BASE,IND,ATT,VAL,OR,MODE) 
 I MODE'=3 D PA^%QMCPZ(WH,QUI,BASE,IND,ATT,VAL,OR) Q
 N T
 S T=$C(9)
 D STOLK(QUI1,"ATT"_T_BASE_T_IND_T_ATT_T_VAL_T_OR)
 Q
CREER1(QUI1,WH,QUI,BASE,IND,ORD,REEL,MSG,LIEN,MODE) 
 I MODE'=3 Q $$CREER1^%QMCPZ(WH,QUI,BASE,IND,ORD,REEL,.MSG,LIEN)
 N T
 S T=$C(9)
 D STOLK(QUI1,"IND"_T_BASE_T_IND_T_ORD_T_LIEN)
 S MSG=""
 Q 1
ADDO(QUI1,WH,QUI,BASE,IND,OR,LIEN,BASEL,INDL,MODE) 
 I MODE'=3 D ADDO^%QMCPZ(WH,QUI,BASE,IND,OR,LIEN,BASEL,INDL) Q
 N T
 S T=$C(9)
 D STOLK(QUI1,"LIENH"_T_BASE_T_IND_T_OR_T_LIEN_T_BASEL_T_INDL)
 Q
ADDS(QUI1,WH,QUI,BASE,IND,LIEN,BASEL,INDL,MODE) 
 I MODE'=3 D ADDS^%QMCPZ(WH,QUI,BASE,IND,LIEN,BASEL,INDL) Q
 N T
 S T=$C(9)
 D STOLK(QUI1,"LIENR"_T_BASE_T_IND_T_LIEN_T_BASEL_T_INDL)
 Q
 
LILIEN(QUI1,WH,QUI,IND,LIEN,INDL,L) 
 N T
 S T=$C(9)
 D STOLK(QUI1,"LILIEN"_T_IND_T_LIEN_T_INDL_T_L)
 Q
CRETYP(QUI1,WH,QUI,BASE,LISTE,PREF,CARD,SOURCE,ADR,AUTRE,TYPE,TRI,MODE) 
 N T
 S T=$C(9)
 I MODE=1 D CRETYP^%QMCPZ(WH,QUI,BASE,LISTE,PREF,CARD,SOURCE,ADR,AUTRE,TYPE,TRI) Q
 D STOLK(QUI1,"LISTE"_T_BASE_T_LISTE_T_PREF_T_CARD_T_SOURCE_T_AUTRE_T_TYPE)
 Q
 
ADLK(QUI) 
 Q "^[QUI]LK(""QMCPOB"",""A1"",$J,""DATA"",1)"
 
STOLK(QUI,CH) 
 N ADLK,I
 S ADLK=$$ADLK(QUI)
 S I=$ZP(@ADLK@(""))+1
 S @ADLK@(I)=CH
 Q
 
READLK(QUI,CH,LI) 
 N ADLK
 S ADLK=$$ADLK(QUI)
 S LI=$O(@ADLK@(LI))
 I LI="" S CH="" Q
 S CH=@ADLK@(LI)
 Q
 
 
KLK(QUI) 
 N ADKL
 S ADLK=$$ADLK(QUI)
 K @(ADLK)
 Q
 
 
 
 
 
 
 
FLUSH(SUP,IO,ABORT) 
 S ABORT=""
 I SUP="FILE" D FL1
 I SUP="TAPE" D FL2
 D KLK(QUI)
 Q
FL1 N ADLK
 S ADLK=$$ADLK(QUI)
 D ECRIRE^LKFIC(ADLK,"A1",IO)
 Q
FL2 N TEMP,EXTBANDE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"FL2")
 S EXTBANDE=$$CONCAS^%QZCHAD(TEMP,"EXTBANDE")
 K @(TEMP)
 D BANDE(EXTBANDE)
 S ABORT=$$ECRIRE1^LKPRIM("QMCPOB","A1",$J,IO,"ASCIIST","PHYMMN^LKMNTX1",EXTBANDE)
 I ABORT=0 S ABORT=""
 K @(TEMP)
 Q
 
BANDE(EXTBANDE) 
 S @EXTBANDE@("CAR")="A"
 S @EXTBANDE@("ENR")="V"
 S @EXTBANDE@("LBL")="L"
 S @EXTBANDE@("SIZ")=0
 S @EXTBANDE@("BLK")=8000
 Q
 
 
 
 
 
 
 
LOAD(SUP,IO,ABORT) 
 D KLK(QUI)
 S ABORT=""
 I SUP="FILE" D LOAD1
 I SUP="TAPE" D LOAD2
 Q
LOAD1 D ^LKFIC("QMCPOB","A1",$J,IO)
 Q
LOAD2 N TEMP,EXTBANDE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LOAD2")
 S EXTBANDE=$$CONCAS^%QZCHAD(TEMP,"EXTBANDE")
 K @(TEMP)
 D BANDE(EXTBANDE)
 S ABORT=$$LIRE1^LKPRIM("QMCPOB","A1",$J,IO,"ASCIIST","PHYMN^LKMNTX1",EXTBANDE)
 I ABORT=0 S ABORT=""
 K @(TEMP)
 Q

