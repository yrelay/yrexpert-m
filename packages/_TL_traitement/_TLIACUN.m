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

;%TLIACUN^INT^1^59547,74029^0
%TLIACUN(TRT,REP,IND,MODAF,MODEX) ;;02:33 PM  15 Jul 1993; ; 15 Jul 93  4:32 PM
 
 
 
 
 
 
 N CXT,KVARLOC,ABANDON,GDX,OPTIM
 S GDX=0,KVARLOC=1,OPTIM=0
 G:$$OKCOMP^%TLOGCMP(TRT) EXECOMPI
 G AA1
 
CONTEXTO(TRT,REP,IND,MODAF,MODEX,KVARLOC,CXT,ABANDON,OPTIM) 
 G:$$OKCOMP^%TLOGCMP(TRT) EXECOMPI
 G AA1
 
CONTEXT(TRT,REP,IND,MODAF,MODEX,KVARLOC,CXT,ABANDON) 
 N OPTIM
 S OPTIM=0
 G:$$OKCOMP^%TLOGCMP(TRT) EXECOMPI
AA1 N SORT,ADRRET,V,ARRET,CARD,ADR,L,ORIG,RETOUROK,JRN
 N DX,DY,FIRST,%IND,L,LL,NBT,NOM,NX,NY,POS,REPL,TETE,TEXT
 N HACT,HH,MG,MD,ORIGINE,SORT,HALT
 N EXP,VAR,LI,STOP,RETOURGO,CARD,ETIQ,GLOSTO,CTRLA,TYP,COND
 N ITRI,LTRI,SAVIND,TRLIS,TRBOUC,LISTE,SIND
 N ACTI,NOEUACT,DEROUL,MODAFF,TEMPO,RESULT,ECHEC,ERR,NORES
 N TP
 
 
 D:'(OPTIM) REMCTR^%SYSCLAV,SET^%SGVAR("MAP",0)
 D:KVARLOC KVARLOC
 K ^SAVVAL($J)
 S ORIG="TRAIT",ADRRET="SORTIE^%TLIACUN" D INIT^%ANGEPIL
 S LISTE="fictive"
 S TRLIS=0,TRBOUC=0
 
 G SUIT
SORTIE D:KVARLOC KVARLOC
 K ^SAVVAL($J)
 D EPIL^%ANGEPIL
 D:'(OPTIM) DEP^%SGVAR("MAP")
 Q SORT
 
SUIT I '($$OKANA^%TLGEST(TRT)) S SORT=1 D ^%VSQUEAK,POCLEPA^%VVIDEO W TRT_$$^%QZCHW(": traitement non analyse") H 5 G @ADRRET
 S CARD=1
 S MG=80,MD=45,HH=2,HACT=7
 S REPL=$$NOMLOG^%QSF(REP),NBT=0,FIRST=1
 S ORIGINE="TRT"
 S GLOSTO="^[QUI]TTL("""_TRT_""",2)"
 S CXT("@","BASE")=REP,CXT("@","OBJET")=IND
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J
 D:MODAF INIT^%TLIFEN,REAF^%TLIFEN
 S ABANDON=0,HALT=0
 S SIND=1
 I MODAF=1 D NET^%TLIACT3,CLEAR^%QUPILF("ATT"),CLEAR^%QUPILF("ACT"),CLEAR^%QUPILF("LOG")
 S NBT=1,FIRST=0
 D:MODAF IND^%TLIACT3,NBT^%TLIACT3
 D:MODAF=0 INDBAS^%TLIACT3 H:MODEX=1 1
 S ETIQ="",RETOURGO="RETGO^%TLIACUN"
 I $$OKCOMP^%TLOGCMP(TRT) G GOCOMPI^%TLIACT0
 G GO^%TLIACT1
 
RETGO D:MODAF END^%TLIFEN
 S SORT=$S(ABANDON=1:4,HALT=1:4,1:0)
 G @ADRRET
 
 
 
KVARLOC K ^V($J,"%")
KILLVL D SXSPEED^%QSGESTK("%",$J) Q
 
 
 
EXECOMPI 
 N LISTE,SORT,RETOURGO,ISCTRLA,JRN
 N NIV,TP
 D:'(OPTIM) REMCTR^%SYSCLAV,SET^%SGVAR("MAP",0)
 D:KVARLOC KVARLOC
 S LISTE="fictive",ABANDON=0,HALT=0
 
 
 S ISCTRLA=^REMANENCE($J,"CTRLA")
 S CXT("@","BASE")=REP,CXT("@","OBJET")=IND
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J
 D INIT^%ANGEPIL
 S RETOURGO="RETGO2^%TLIACUN"
 G GOCOMPI^%TLIACT0
RETGO2 S SORT=$S(ABANDON=1:4,HALT=1:4,1:0)
 D:KVARLOC KVARLOC
 D:'(OPTIM) DEP^%SGVAR("MAP")
 Q SORT
 
INIOPTIM D REMCTR^%SYSCLAV,SET^%SGVAR("MAP",0) Q
FINOPTIM D DEP^%SGVAR("MAP") Q
 ;
 ;

