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

;%DLEXACT^INT^1^59547,73867^0
DLEXACT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
POSER(MAP,SENS,DATELIM,DESOP,OPDAT,DATFIX,OPRES,GLERR) 
 
 N SOM,MA,LIB,CPT,PREMER,ERRNONBL,DAT
 K @(OPRES)
 S SOM="",CPT=1,PREMER=1,ERRNONBL=0
BPOSER S SOM=$O(@DESOP@(SOM))
 G:SOM="" FPOSER
 S MA=@DESOP@(SOM,0)
 G:'($D(@DATFIX@(@DESOP@(SOM,1)))) POSE1
 G:@DATFIX@(@DESOP@(SOM,1))=@OPDAT@(SOM) POSE1
 S LIB=$$^%QZCHW("date fixee")_" ("_$$DATENO3^%QMDATE(@DATFIX@(@DESOP@(SOM,1)))_") "_$$^%QZCHW("differente de date trouvee")_" ("_$$DATENO3^%QMDATE(@OPDAT@(SOM))_")"
 G POSE3
POSE1 G:'($$ADDCONT^%DLCAPA(MA,"",$$CAPASTA^%DLCAP2(MA,"",1),@OPDAT@(SOM),@DESOP@(SOM,2))) BPOSE2
 D AFF^%DLCORCA(DESOP,SOM,@OPDAT@(SOM),@OPDAT@(SOM,"L"),0,@DESOP@(SOM,2),OPRES,1,.CPT)
 I SENS=1 S:@OPDAT@(SOM)>DATELIM ERRNONBL=8 G BPOSER
 S:@OPDAT@(SOM)<DATELIM ERRNONBL=8
 G BPOSER
BPOSE2 S LIB=$$^%QZCHW("impossible de placer la charge")_" "_@DESOP@(SOM,2)_" "_$$^%QZCHW("sur la machine")_" "_MA_" "
 S LIB=LIB_$$^%QZCHW("a la date du")_" "_$$DATENO3^%QMDATE(@OPDAT@(SOM))
POSE3 D ADDER(@DESOP@(SOM,1),LIB)
 S ERR=101
 G BPOSER
 
FPOSER S:ERRNONBL'=0 ERR=ERRNONBL
 Q:(ERR+0)=0 1
 D RETRAIT^%DLCAP2(OPRES)
 Q 0
 
ADDER(SOMMET,MESSAGE) 
 N NOER
 Q:(MAP=0)&(DECAL'=0)
 S NOER=$S($D(@GLERR):@GLERR+1,1:1)
 I PREMER S PREMER=0,@GLERR@(NOER)=$$RGAMME^%DLCON2_" "_COMPOSANT_" : "_$$^%QZCHW("positionnement sans decalage"),@GLERR@(NOER+1)=$TR($J("",$L(@GLERR@(NOER)))," ","-"),NOER=NOER+2
 S @GLERR@(NOER)=SOMMET_" : "_MESSAGE
 S @GLERR=NOER
 S ERR=1
 Q
 ;
 ;

