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

;TORESPAR^INT^1^59547,74875^0
TORESPAR ;
 
 S DOLARI=$I D ZD^%QMDATE4,^%QMDAK0
 S TIT="resultats de comprehensions" D ^TOGETART
QUES G:'($D(^TACOMPIL($I))) END
 S DOLARI=$I,DEV=^TABIDENT(WHOIS,"PRINTER")
 D CLEPAG^%VVIDEO S DX=0,DY=10 X XY
 
 W "Voulez vous les resultats de la comprehension sur " S SUP=$$^%VZESOR("E") I SUP=-1 G FIN
 I (SUP'=0)&(SUP'=1) G QUES
 S SUP=$S(SUP=1:"I",1:"E") W " OK"
 S LILIM=17 I SUP="I" S LILIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-3,1:63)
ENTREE S DX=0,DY=6 D CLEBAS^%VVIDEO W "Un instant..."
 D ^TORESBRF S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1) G:SUP="I" IMPR
ECR D CLEPAG^%VVIDEO S DEV=0,PAGE=1 D AFF1
SUIT D POCLEPA^%VVIDEO W " CTRLA : Abandon, +, -, page" S PAG="Page "_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=0 X XY W PAG S DX=(($X-$L(NBPAG))-1)-$L(PAGE),DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-"
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 D AFF G SUIT
1 G END
6 G END
43 G 61
45 S NPAG=PAGE-1 D AFF G SUIT
61 S NPAG=PAGE+1 D AFF G SUIT
AFF I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK Q
 S PAGE=NPAG,DX=0,DY=1 D CLEBAS^%VVIDEO
AFF1 F LG=1:1:LILIM Q:'($D(^POSENR(DOLARI,PAGE,LG)))  U DEV W !,$E(^POSENR(DOLARI,PAGE,LG),1,78)
 Q
END K ^POSENR($I),Y1,PAGE,LG,NBPAG,NPAG,DEV,LILIM,PAG,SUP,DOLARI,%DAT,HEURE,^POSENR($I),CTRLA,CTRLF Q
 
IMPR O DEV F PAGE=1:1:NBPAG D ENTET,AFF1
 U DEV W !,# C DEV G END
ENTET U DEV W #,!,?2,"Le : ",%DAT," a : ",HEURE,?29,"*** RESULTATS DE COMPREHENSIONS ***",?68,"Page : ",PAGE,!
 Q
FIN Q

