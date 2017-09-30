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

;%TLQUER2^INT^1^59547,74030^0
%TLQUER2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MAJ(GLOTTT,TTT,MODIF,ANAL,ANAOK) 
 Q:'($$EXISTE^%TLQUER(TTT))
 D EMBRAYE^%TLQUER
 D:MODIF PA^%QSGESTI("TRAITEMENT",TTT,"DATE.DERNIERE.MODIFICATION",$$DATE^%QMDATE,1)
 D:ANAL REINIT(TTT)
 D:ANAOK&ANAL AFFECT(TTT)
 D PA^%QSGESTI("TRAITEMENT",TTT,"ANALYSE.CORRECTE",ANAOK,1)
 D DEBRAYE^%TLQUER
 Q
 
 
 
 
REINIT(TTT) 
 
 N LATTR,INDAT,I,LAPPEL,TYPEAP,IAPPEL,PHRASV,NBREG,NBPHRAS,ATTR,IATT
 D EMBRAYE^%TLQUER
 
 D PSV^%QSGESTI("TRAITEMENT",TTT,"ATTRIBUT.TEMPORAIRE")
 D PSV^%QSGESTI("TRAITEMENT",TTT,"ATTRIBUT.UTILISE")
 
 D MVG^%QSCALVA("TRAITEMENT",TTT,"APPELLE","LAPPEL",.TYPEAP)
 S IAPPEL="" F I=0:0 S IAPPEL=$O(LAPPEL(IAPPEL)) Q:IAPPEL=""  D SUPS^%QSGEST3("TRAITEMENT",TTT,"APPELLE","TRAITEMENT",LAPPEL(IAPPEL))
 S PHRASV="",NBPHRAS=0,NBREG=0
 F I=0:0 S PHRASV=$O(@GLOTTT@(PHRASV)) Q:PHRASV=""  S NBPHRAS=NBPHRAS+1 S:$E(@GLOTTT@(PHRASV))'=":" NBREG=NBREG+1
 D PA^%QSGESTI("TRAITEMENT",TTT,"NOMBRE.DE.PHRASES",NBPHRAS,1)
 D PA^%QSGESTI("TRAITEMENT",TTT,"NOMBRE.DE.REGLES",NBREG,1)
 D DEBRAYE^%TLQUER
 Q
 
 
 
 
AFFECT(TTT) 
 
 N I,REGSV,ATTSV,ESPO,CHSPO,APPSV,APEXI,VXAC,%c,%INDICE,PCHCOMP
 
 
 D EMBRAYE^%TLQUER
 S REGSV="" F I=0:0 S REGSV=$O(@GLOTTT@(REGSV)) Q:REGSV=""  D CPYATT,CPYAPP,CPYAPX
 D DEBRAYE^%TLQUER
 Q
 
CPYATT 
 Q:'($D(@GLOTTT@(REGSV,"NBR.ATTRIBUTS")))
 F CPA=1:1:@GLOTTT@(REGSV,"NBR.ATTRIBUTS") D AFFATT
 Q
AFFATT S ATTSV=@GLOTTT@(REGSV,"ATTRIBUT."_CPA)
 S:$D(ESPO(REGSV,ATTSV))=0 ESPO(REGSV,ATTSV)=0 S ESPO(REGSV,ATTSV)=ESPO(REGSV,ATTSV)+1
 I ESPO(REGSV,ATTSV)=1 S CHSPO(ATTSV)=$S($D(CHSPO(ATTSV))'=0:CHSPO(ATTSV)_",",1:""),CHSPO(ATTSV)=CHSPO(ATTSV)_REGSV
 S %c=$$LEX^%LXSTOCK(ATTSV,.PCHCOMP)
 S:%c=0 PCHCOMP="ATTRIBUT.TEMPORAIRE",%INDICE=ATTSV
 S:%c'=0 %INDICE=PCHCOMP,PCHCOMP="ATTRIBUT.UTILISE"
 
 I ESPO(REGSV,ATTSV)=1 S:$L(CHSPO(ATTSV))>70 CHSPO(ATTSV)=$E(CHSPO(ATTSV),1,70)_" etc" D PA^%QSGESTI("TRAITEMENT",TTT,PCHCOMP,CHSPO(ATTSV),%INDICE)
 Q
 
CPYAPP 
 Q:'($D(@GLOTTT@(REGSV,"NBR.APPELS")))
 Q:'($$VERIF^%QSGES26("TRAITEMENT","APPELLE","TRAITEMENT"))
 F CPA=1:1:@GLOTTT@(REGSV,"NBR.APPELS") D AFFAPP
 Q
AFFAPP S APPSV=@GLOTTT@(REGSV,"APPEL."_CPA)
 I '($$IR^%QSGE5("TRAITEMENT",APPSV)) G SINON
 D:'($$VAIR^%QSGE5("TRAITEMENT",TTT,"APPELLE",APPSV)) ADDS^%QSGES26("TRAITEMENT",TTT,"APPELLE","TRAITEMENT",APPSV)
 Q
SINON I '($$VAIR^%QSGEST5("TRAITEMENT",TTT,"NON.RESOLU",APPSV)) D PA^%QSGESTI("TRAITEMENT",TTT,"NON.RESOLU",APPSV,APPSV)
 Q
 
CPYAPX 
 Q:'($D(@GLOTTT@(REGSV,"NBR.APPELS.CALCULES")))
 S APEXI=@GLOTTT@(REGSV,"NBR.APPELS.CALCULES") Q:APEXI=0
 I $$AIR^%QSGEST5("TRAITEMENT",TTT,"APPEL.CALCULE") S VXAC=$$^%QSCALVA("TRAITEMENT",TTT,"APPEL.CALCULE") G FINSI3
 S VXAC=0
FINSI3 D PA^%QSGESTI("TRAITEMENT",TTT,"APPEL.CALCULE",VXAC+APEXI)
 Q
 
 
 
RESERVE(NOMATT) 
 
 
 
 Q:NOMATT="NOM" 1
 Q:NOMATT="ENTETE" 1
 Q:NOMATT="ANALYSE.CORRECTE" 1
 Q:NOMATT="NOMBRE.DE.REGLES" 1
 Q:NOMATT="DATE.DERNIERE.MODIFICATION" 1
 Q:NOMATT="NON.RESOLU" 1
 Q:NOMATT="APPEL.CALCULE" 1
 Q:NOMATT="APPELLE" 1
 Q:NOMATT="APPELE.PAR" 1
 Q:NOMATT="NOMBRE.DE.PHRASES" 1
 Q:NOMATT="TRAITEMENT" 1
 Q 0
 ;

