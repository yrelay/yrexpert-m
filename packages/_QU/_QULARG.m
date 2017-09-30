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

;%QULARG^INT^1^59547,73885^0
%QULARG ;;10:39 AM  31 Jul 1992; ; 31 Jul 92 11:11 AM
 
 
 
 N RES,LISTEIND,ATT,ATTDL,ORDL,GLOB
 D CLEPAG^%VVIDEO
 S (LISTEIND,CTR)="" D LIRE2^%VREAD("Nom de la liste des individus : ",LISTEIND,2,75,5,4,"","",.CTR,.LISTEIND) Q:CTR'=""
 S ATT="" D LIRE2^%VREAD("Nom du lien a suivre : ",ATT,2,75,7,6,"","",.CTR,.ATT) Q:CTR'=""
 S ATTDL="" D LIRE2^%VREAD("Attribut du lien : ",ATTDL,2,40,9,8,"","",.CTR,.ATTDL) Q:CTR'=""
 S ORDL=1,CTR="" D LIRE2^%VREAD("Numero d'ordre : ",ORDL,2,75,11,10,"","",.CTR,.ORDL) Q:CTR'=""
 S GLOB="" D LIRE2^%VREAD("Global    : ",GLOB,2,75,16,13,"","",.CTR,.GLOB)
 D MKGLO(LISTEIND,ATT,ATTDL,ORDL,GLOB)
 Q
 
 
 
FEXTER(LISTE,ATT,ATDULIEN,ORUDLIEN,GLO) 
 D MKGLO(LISTE,ATT,ATDULIEN,ORDULIEN,GLO)
 Q
 
MKGLO(LISTE,ATT,ATDULIEN,ORDULIEN,GLO) 
 N FILE,MARQUE,ORD,BASE,REPLIEN,ADR,I,%I,IND
 
 S FILE=$$TEMP^%SGUTIL
 S MARQUE=$$TEMP^%SGUTIL
 S @FILE=0
 
 S REPLIEN=$$LIENI^%QSGEL3
 
 
 
 
 S BASE=$$BASE^%QSGEST7(LISTE)
 
 S ADR=$$ADRLT^%QSGEST7(LISTE) G:ADR="" NONTRIE
 
 S I="" F %I=0:0 S I=$O(@ADR@(I)) Q:I=""  S IND=@ADR@(I),@FILE=@FILE+1,@FILE@(@FILE)=IND,@MARQUE@(IND)=""
 G FINTRI
NONTRIE 
 S ADR=$$ADRLIS^%QSGEST7(LISTE) G:LISTE="" FIN
 S IND="" F %I=0:0 S IND=$O(@ADR@(IND)) Q:IND=""  S @FILE=@FILE+1,@FILE@(@FILE)=IND,@MARQUE@(IND)=""
 
FINTRI 
 
 
 
 S IFIL=""
NXIND S IFIL=$O(@FILE@(IFIL)) G:IFIL="" FIN
 
ARCHREP S IND=@FILE@(IFIL)
 
 
 S ORD=""
NXORD S ORD=$$NXTRIAO^%QSTRUC8(BASE,IND,ATT,ORD) G:ORD="" NXIND
 S NOMIND2=$$VALEUR^%QSTRUC8(BASE,IND,ATT,ORD)
 I $D(@MARQUE@(NOMIND2)) G TRTL
 S @MARQUE@(NOMIND2)=""
 S @FILE=@FILE+1,@FILE@(@FILE)=NOMIND2
TRTL S NOMLI=$$NOML1^%QSGES20(IND,ORD,ATT,NOMIND2) G:NOMLI="" TRTLMIS
 G:'($$OAIR^%QSGE5(REPLIEN,NOMLI,ATDULIEN,ORDULIEN)) TRTLMIS
 S @GLO@(IND,NOMIND2)=$$VALEUR^%QSTRUC8(REPLIEN,NOMLI,ATDULIEN,ORDULIEN)
 G NXORD
TRTLMIS 
 S @GLO@(IND,NOMIND2)=""
 G NXORD
 
 
FIN K @(FILE),@(MARQUE)
 Q
 ;
 ;

