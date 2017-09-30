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

;%TLGEST^INT^1^59547,74029^0
%TLGEST ;;10:14 PM  10 Sep 1992; ; 25 Oct 93 10:49 AM
 
 
 
 
 
SIGNAL(TTT) 
 Q:TTT=""
 Q:'($$REPM^%QSGEST9("TRAITEMENT"))
 I TTT="z" D:$$EXISTE^%TLQUER("t."_TTT) SUPP^%TLQUER("t."_TTT) Q
 I $D(^[QUI]TTL(TTT)) D:'($$EXISTE^%TLQUER("t."_TTT)) CREER^%TLQUER("t."_TTT) Q
 D:$$EXISTE^%TLQUER("t."_TTT) SUPP^%TLQUER("t."_TTT)
 Q
 
 
 
EXISTE(TTT) 
 D SIGNAL(TTT)
 Q $D(^[QUI]TTL(TTT))
 
CREER(TTT) 
 S ^[QUI]TTL(TTT,"DATE.CREATION")=$$DATE^%QMDATE
 S ^[QUI]TTL(TTT,"ANALYSE.CORRECTE")=1
 D CREER^%TLQUER("t."_TTT)
 D AFFVAL^%TLQUER("t."_TTT,"DATE.CREATION",1,$$DATE^%QMDATE)
 D AFFVAL^%TLQUER("t."_TTT,"ANALYSE.CORRECTE",1,1)
 S ^TOZE(QUI,"ROUTINES")=0
 Q
 
SUPP(TTT) 
 K ^[QUI]TTL(TTT)
 D KILLCOMP^%TLOGCMP(TTT)
 D SUPP^%TLQUER("t."_TTT)
 Q
 
 
 
NETTOIE(TTT) 
 K ^[QUI]TTL(TTT)
 D KILLCOMP^%TLOGCMP(TTT)
 D MAJ^%TLQUER2("^[QUI]TTL("""_TTT_""",2)","t."_TTT,1,1,0)
 D SETANA(TTT,0)
 Q
 
MAJ(TTT,MODIF,ANAL,ANAOK) 
 N VERS
 D MAJ^%TLQUER2("^[QUI]TTL("""_TTT_""",2)","t."_TTT,MODIF,ANAL,ANAOK)
 D SETANA(TTT,ANAOK)
 Q:'(MODIF)
 S ^TOZE(QUI,"ROUTINES")=0
 D SETDATE(TTT,$$DATE^%QMDATE_" "_$$^%QZCHW("a")_" "_$$HEURE^%QMDATE)
 S VERS=$$GETVAL^%TLQUER("t."_TTT,"CARD",1) S:VERS="" VERS=0 D AFFVAL^%TLQUER("t."_TTT,"CARD",1,VERS+1)
 D AFFVAL^%TLQUER("t."_TTT,"AUTEUR",1,WHOIS)
 Q
 
AFFVAL(TTT,ATTRIB,INDICE,VALEUR) 
 S:((ATTRIB="ANALYSE.CORRECTE")!(ATTRIB="DATE.CREATION"))!(ATTRIB="DATE.DERNIERE.MODIFICATION") ^[QUI]TTL(TTT,ATTRIB)=VALEUR
 Q:'($$EXISTE^%TLQUER("t."_TTT))
 D AFFVAL^%TLQUER("t."_TTT,ATTRIB,INDICE,VALEUR)
 Q
 
GETVAL(TTT,ATTRIB,INDICE) 
 N VALEUR
 I $D(^[QUI]TTL(TTT,ATTRIB))#10 Q ^[QUI]TTL(TTT,ATTRIB)
 Q:'($$EXISTE^%TLQUER("t."_TTT)) ""
 Q $$GETVAL^%TLQUER("t."_TTT,ATTRIB,INDICE)
 
SETANA(TTT,BOOL) 
 S ^[QUI]TTL(TTT,"ANALYSE.CORRECTE")=BOOL
 Q:'($$EXISTE^%TLQUER("t."_TTT))
 D AFFVAL^%TLQUER("t."_TTT,"ANALYSE.CORRECTE",1,BOOL)
 Q
 
OKANA(TTT,BOOL) 
 Q:'($D(^[QUI]TTL(TTT,"ANALYSE.CORRECTE"))) 0
 Q ^[QUI]TTL(TTT,"ANALYSE.CORRECTE")
 
 
 
 
 
 
 
 
 
 
MAJCOM(TTT) 
 N COMSV
 
 
 
 S COMSV="" F I=0:0 S COMSV=$O(^[QUI]TTL(TTT,1,COMSV)) Q:COMSV=""  D AFFVAL^%TLQUER("t."_TTT,"ENTETE",COMSV,$E(^[QUI]TTL(TTT,1,COMSV),1,150))
 Q
 
SETDATE(TTT,DATE) 
 S ^[QUI]TTL(TTT,"DATE.DERNIERE.MODIFICATION")=DATE
 D AFFVAL^%TLQUER("t."_TTT,"DATE.DERNIERE.MODIFICATION",1,DATE)
 Q
 
GETDATE(TTT) 
 Q:'($D(^[QUI]TTL(TTT,"DATE.DERNIERE.MODIFICATION"))) 0
 Q ^[QUI]TTL(TTT,"DATE.DERNIERE.MODIFICATION")
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
RECTRT(WHOIS1,QUI1,TRT1,WHOIS2,QUI2,TRT2,MODE,XMODE) 
 N SVGQUI,SVGWHOIS,GLOVAL,I,ITRT,GLATT1,ATT,%ATT,IND,%IND,VAL,%VAL,TEMP
 N I,T,NBFILS,NOMCLF
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"RECTRT")
 K @(TEMP)
 S T=$C(9)
 S SVGQUI=QUI,SVGWHOIS=WHOIS,QUI=QUI2,WHOIS=WHOIS2 D CREER^%TLGEST(TRT2) S QUI=SVGQUI,WHOIS=SVGWHOIS
 
 F I=1:1 Q:'($D(^[QUI1]TTL(TRT1,1,I)))  D RECTRT1
 F I=1:1 Q:'($D(^[QUI1]TTL(TRT1,2,I)))  D RECTRT2
 I XMODE=3 D STOLK^%QMCPOZ(QUI,"TRTF"_T_TRT2) K @(TEMP) Q
 
 D RECTRT^%TLQUER3(WHOIS1,QUI1,"t."_TRT1,WHOIS2,QUI2,"t."_TRT2,MODE,XMODE)
 
 D COPYCOMP^%TLOGCMP(QUI1,TRT1,QUI2,TRT2)
 K @(TEMP)
 Q
RECTRT1 
 I XMODE'=3 S ^[QUI2]TTL(TRT2,1,I)=^[QUI1]TTL(TRT1,1,I) Q
 D STOLK^%QMCPOZ(QUI,"TRTCO"_T_^[QUI1]TTL(TRT1,1,I))
 Q
RECTRT2 
 S:(XMODE'=3)&$D(^[QUI1]TTL(TRT1,2,I,"NL")) ^[QUI2]TTL(TRT2,2,I,"NL")=^[QUI1]TTL(TRT1,2,I,"NL")
 I XMODE'=3 S ^[QUI2]TTL(TRT2,2,I)=^[QUI1]TTL(TRT1,2,I) D:MODE RECTRT3 Q
 D STOLK^%QMCPOZ(QUI,"TRTSO"_T_^[QUI1]TTL(TRT1,2,I))
 Q
RECTRT3 
 S:$D(^[QUI1]TTL(TRT1,2,I,"TETE")) ^[QUI2]TTL(TRT2,2,I,"TETE")=$$COPY^%ANA(QUI1,^[QUI1]TTL(TRT1,2,I,"TETE"),QUI2)
 S LEAF="" F J=0:0 S LEAF=$O(^[QUI1]TTL(TRT1,2,I,LEAF)) Q:LEAF=""  S:(LEAF'="TETE")&(LEAF'="NL") ^[QUI2]TTL(TRT2,2,I,LEAF)=^[QUI1]TTL(TRT1,2,I,LEAF)
 Q
 ;

