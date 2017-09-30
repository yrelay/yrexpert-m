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

;%TLOUGLO^INT^1^59547,74030^0
%TLOUGLO ;;09:04 AM  2 Sep 1993; ; 09 Aug 93 10:49 AM
 
 
 
 
 
 
 
 
 G MOTEUR
 
 
 N IND,V,%V
 K ^%RQSGLO("VERBE")
 
 S IND=""
BCLIND S IND=$$NXTRI^%QSTRUC8("VERBE",IND) Q:IND=""
 G:'($$AIR^%QSGE5("VERBE",IND,"FORME.GENERIQUE")) BCLIND
 S ^%RQSGLO("VERBE","OBJ",IND)=""
 F ATT="TEXTE.PROLOGUE","TEXTE.EPILOGUE","RAFRAICHIR.APRES.EXECUTION","AUTORISE.EN.TACHE.CARROUSEL","FORME.GENERIQUE","ADRESSE.DE.LA.ROUTINE" I $$AIR^%QSGE5("VERBE",IND,ATT) S V=$$^%QSCALVA("VERBE",IND,ATT),^%RQSGLO("VERBE","OBJ",IND,ATT,1)=V
 S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8("VERBE",IND,"NATURE.PARAMETRE",O) Q:O=""  S V=$$VALEUR^%QSTRUC8("VERBE",IND,"NATURE.PARAMETRE",O),^%RQSGLO("VERBE","OBJ",IND,"NATURE.PARAMETRE",O)=V
 G BCLIND
 
 
 
MOTEUR 
 N IND,V,%V,MO,%MO
 S MO="" F %MO=0:0 S MO=$$NXTRI^%QSTRUC8("MOTEUR",MO) Q:MO=""  D UNMO
 D INITRQS^%QMEXUTI
 D ^%AMGHUCM
 D ^%AMGRUCM
 Q
UNMO 
 K ^%RQSGLO("MOTEUR",MO,"VERBE")
 
 S IND=""
MOIND S IND=$$NXTRIAO^%QSTRUC8("MOTEUR",MO,"VERBE",IND) Q:IND=""
 S CIND=MO_","_IND
 G:'($$AIR^%QSGE5("VERBE",CIND,"FORME.GENERIQUE")) MOIND
 S ^%RQSGLO("MOTEUR",MO,"VERBE",IND)=""
 F ATT="TEXTE.PROLOGUE","TEXTE.EPILOGUE","RAFRAICHIR.APRES.EXECUTION","AUTORISE.EN.TACHE.CARROUSEL","FORME.GENERIQUE","ADRESSE.DE.LA.ROUTINE" I $$AIR^%QSGE5("VERBE",CIND,ATT) S V=$$^%QSCALVA("VERBE",CIND,ATT),^%RQSGLO("MOTEUR",MO,"VERBE",IND,ATT,1)=V
 S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8("VERBE",CIND,"NATURE.PARAMETRE",O) Q:O=""  S V=$$VALEUR^%QSTRUC8("VERBE",CIND,"NATURE.PARAMETRE",O),^%RQSGLO("MOTEUR",MO,"VERBE",IND,"NATURE.PARAMETRE",O)=V
 G MOIND

