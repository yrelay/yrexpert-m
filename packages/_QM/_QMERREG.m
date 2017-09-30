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

;%QMERREG^INT^1^59547,73878^0
QMERREG(ACT,XG,YH,DH,DV,BASE,IND,ATT,VAL,ORD,GLO,AFF) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %G,%T,DUP,G,GL,LIGN,T,TY,TYP,SAIDIR,INDI
 G:ACT="S" SUPP G:ACT="C" AFFI
 G:ACT="M" MOD G:ACT="I" SAISS
 
SAIS 
 
 
NQ I '($$AIR^%QSGEST5(BASE,IND,ATT)) S ORD=1 G SAISS
 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("No d'ordre : "))
 I CTRLA D FIN("","") S AFF=1 Q
 S:Y1="" Y1=1
 I $$OAIR^%QSGE5(BASE,IND,ATT,Y1) D ^%VZEAVT($$^%QZCHW("Numero d'ordre existant")) G NQ
 S ORD=Y1
SAISS D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY S VAL=$$^%VZAME1($$^%QZCHW("Type (\Nom) de la regle ?"))
 I VAL="" D FIN("","") S AFF=1 Q
 N TYP,ELEM,LIBTYP
 I '($$CONT(VAL,.LIBTYP,.TYP,.ELEM)) D FIN("","") Q
 S OK=1
 I TYP="SAIS" D CREA^%QMERRGS(.ELEM,.OK)
 I TYP="TRT" D CREA^%QMERRGT(.ELEM,.OK)
 S AFF=3
 I '(OK) D FIN("","") Q
 D FIN(LIBTYP_"\"_ELEM,ORD)
 S:ACT="A" GLO("AJ",ATT,ORD)=LIBTYP_"\"_ELEM
 S:ACT="I" GLO("MOD",ATT,ORD)=LIBTYP_"\"_ELEM
 Q
MOD 
 
 
 G:VAL="" SAIS
 I '($$CONT(VAL,.LIBTYP,.TYP,.ELEM)) D FIN("","") Q
 I TYP="SAIS" D CREA^%QMERRGS(ELEM)
 I TYP="TRT" D MOD^%QMERRGT(ELEM)
 D FIN(VAL,ORD)
 S AFF=3 Q
 
SUPP 
 
 
 
 I VAL="" D ^%VSQUEAK S AFF=0 Q
 S AFF=1,DX=XG,DY=23 X XY
 D POCLEPA^%VVIDEO G:$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de la regle ")_VAL_$$^%QZCHW(" d'indice ")_ORD_" ?")'=1 FINS
 I ORD="" S ORD=1
 S GLO("SUP",ATT,ORD)=VAL,AFF=3
FINS D FIN(VAL,ORD) Q
 
AFFI 
 
 
 I '($$CONT(VAL,.LIBTYP,.TYP,.ELEM)) Q
 I TYP="SAIS" D AFFI^%QMERRGS(ELEM)
 I TYP="TRT" D MOD^%QMERRGT(ELEM)
 D FIN(VAL,ORD)
 S AFF=3 Q
 
 
CONT(TXT,LIBACT,ACT,ELEM) 
 N OK,LIBELEM,R
 S AFF=1,OK=0,LIBACT=$$GETLBLAN^%VTLBLAN($P(TXT,"\")),ELEM=$$GETLBLAN^%VTLBLAN($P(TXT,"\",2))
 Q:LIBACT="" 0
 I LIBACT=$$^%QZCHW("QUEMANDER") S ACT="SAIS",OK=1,LIBELEM=$$^%QZCHW("de la SAISIE ?")
 I LIBACT=$$^%QZCHW("TRAITER") S ACT="TRT",OK=1,LIBELEM=$$^%QZCHW("du traitement ?")
 I '(OK) D ^%VZEAVT($$^%QZCHW("Les seules possibilites sont QUEMANDER ou TRAITER")) Q 0
 Q:(ELEM'="")&(ELEM'="?") 1
 I ELEM'="?" D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY S ELEM=$$^%VZAME1($$^%QZCHW("Nom ")_LIBELEM)
 G:ELEM'="?" FCO
 
 I ACT="SAIS" D LISTE^%QMEA(.ELEM) S AFF=3 G FCO
 I ACT="TRT" D CLEPAG^%VVIDEO,AIDE2^%TLDIAL4("",1,0,"ELEM")
 S AFF=3
 S:ELEM'="" ELEM=$O(ELEM(""))
FCO Q ELEM'=""
 
FIN(V,O) 
 S VAL=V,ORD=O Q
 
COPUSH(PILE,WHOIS1,QUI1,BASE1,IND1,ATT1,VAL,WHOIS2,QUI2,BASE2,IND2,ATT2,MODE) 
 
 
 
 N OR,I,BTRT,BSAISIE,BASE,TYPE
 S BTRT=$$ONE^%QSGEL3("TRAITEMENT")
 S BSAISIE=$$ONE^%QSGEL3("SAISIE")
 S OR=$O(@VAL@(""))
 F I=0:0 Q:OR=""  D PUSH1 S OR=$O(@VAL@(OR))
 I MODE=0 Q
 
 D MVS^%QMCPOZ(QUI,WHOIS2,QUI2,BASE2,IND2,ATT2,VAL,MODE)
 Q
PUSH1 
 S TYPE=$P(@VAL@(OR),"\",1)
 S BASE=$S(TYPE="QUEMANDER":BSAISIE,TYPE="TRAITER":BTRT,1:"")
 
 
 I BASE'="" D PUSH^%QCASTA(PILE,$P(@VAL@(OR),"\",2)_"^"_BASE)
 Q

