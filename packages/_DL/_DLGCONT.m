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

;%DLGCONT^INT^1^59547,73868^0
DLGCONT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
POSER(COCONT,MAX,SENS,GRAPH,GRAPHINV,FEUILLES,RACINES,PLPREC,OP,OPDAT,REGIMAC,DATEFIX,DATE,DATELIM,OPRES,LISRES) 
 N NONTRAIT,CPT,DEC1,DEC2,NBDEC,MAXDEC,PLUS,D,CAPST,LOP,PREMER
 N DL,ERRSTAN,ERRNONBL,PREM,DA,LDEC,LJOURS
 S ERR=0,PREMER=1,ERRNONBL=0
 S LDEC=$$^%QZCHW("decalage de"),LJOURS=$$^%QZCHW("jours")
 S NONTRAIT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(NONTRAIT),@(OPRES)
 S SOM=""
 F %I=0:0 S SOM=$O(@OP@(SOM)) Q:SOM=""  S @NONTRAIT@(SOM)="" K @OP@(SOM,3)
 S NBDEC=0,PLUS=1,CPT=1
 S MAXDEC=MAX*COCONT
 S MAXDEC=$S((MAXDEC#100)=0:MAXDEC/100,(MAXDEC#100)<50:MAXDEC\100,1:(MAXDEC\100)+1)
 S ERRSTAN=8
 G:SENS=-1 CONTAMO^%DLGCON2
 
 
 
 S SOM="",LOP="",DL=DATELIM
COBAV1 S SOM=$O(@FEUILLES@(SOM))
 G:SOM="" COBAV2
 S MA=@OP@(SOM,0),CHA=@OP@(SOM,2)
 S CAPST=$$CAPASTA^%DLCAP2(MA,"",0)
 S DEC1=0,PREM=0,DA=DATE
 G:'($D(@DATEFIX@(@OP@(SOM,1)))) COBAV1L
 S DA=@DATEFIX@(@OP@(SOM,1))
 I DA<DATE S ERR=43 G DEC
 I '($$DECAL^%DLCAP2(DATE,DA,@REGIMAC@(MA),.DEC1,MAXDEC)) S ERR=43 G CONTER
 S PREM=1
COBAV1L S RES2=$$DATAVAL^%DLCAPA(MA,"",CAPST,DA,DATELIM,CHA,@REGIMAC@(MA),PLUS,PREM,NBDEC,MAXDEC,.DB1,.DF1,.DEC1)
 S LOP=$S(DEC1=0:"",1:"("_LDEC_" "_DEC1_" "_LJOURS_")")
 I RES2=0 S ERR=$S(PREM=1:43,1:39) G CONTER
 K @NONTRAIT@(SOM)
 G:'($$COAV) CONTER
 S:DF1>DATELIM ERRNONBL=8
 G COBAV1
 
 
COBAV2 S SOM=$O(@NONTRAIT@(SOM))
 G:SOM="" CONTCONT
 S PREC="",ERRSTAN=41
 
COBAV3 S PREC=$O(@GRAPHINV@(SOM,PREC))
 G:PREC="" COBAV4
 G:$D(@NONTRAIT@(PREC)) COBAV2
 G COBAV3
 
COBAV4 S MA=@OP@(SOM,0)
 S PREC="",D=0,LOP="",DL=DATE
COBAV5 S PREC=$O(@GRAPHINV@(SOM,PREC))
 G:PREC="" COBAV6
 S D2=$$ADDJOUR^%QMDRUTI(@OP@(PREC,3),@GRAPH@(PREC,SOM),@REGIMAC@(@OP@(PREC,0)),.ERRT)
 I ERR'=0 S ERR=ERR+36 G CONTER
 S:D2>DATELIM ERRNONBL=8
 S:@OP@(PREC,3)>DL DL=@OP@(PREC,3)
 S:(D2>D)!(LOP="") D=D2,LOP=PREC
 G COBAV5
 
COBAV6 S CHA=@OP@(SOM,2)
 S CAPST=$$CAPASTA^%DLCAP2(MA,"",0)
 S DEC2=0,PREM=0
 G:'($D(@DATEFIX@(@OP@(SOM,1)))) COBAV6L
 S DA=@DATEFIX@(@OP@(SOM,1))
 I '($$DECAL^%DLCAP2(D,DA,@REGIMAC@(MA),.DEC2,MAXDEC)) S ERR=43 G CONTER
 S PREM=1,D=DA
COBAV6L S RES2=$$DATAMON^%DLCAPA(MA,"",CAPST,D,DL,CHA,@REGIMAC@(MA),PLUS,PREM,NBDEC,MAXDEC,.DB2,.DF2,.DEC2)
 I RES2=0 S ERR=$S(PREM=1:43,1:39) G CONTER
 S LOP=$$^%QZCHW("Jalon entre")_" "_@OP@(SOM)_" "_$$^%QZCHW("et")_" "_@OP@(LOP)_" : "_@GRAPH@(LOP,SOM)_$S(DEC2=0:"",1:" (+ "_LDEC_" "_DEC2_" "_LJOURS_")")
 K @NONTRAIT@(SOM)
 G:'($$COAM) CONTER
 S:DF2>DATELIM ERRNONBL=8
 S SOM=""
 G COBAV2
 
 
 
CONTCONT I ERRNONBL'=0 S ERR=ERRNONBL G CONTER
 I $D(@NONTRAIT) K @(NONTRAIT) G CONTER
 Q 1
 
CONTER D RETRAIT^%DLCAP2(OPRES)
 K @(NONTRAIT),@(OPRES)
 D:MAP ADDER("",$$^%QZCHW("Impossible de respecter le coefficient de contraction"))
 Q 0
 
 
COAV() 
 S X=$$NEXT^%DLCORCA(DB1,1,LOP,"",DL,@OP@(SOM,0),@OP@(SOM,2),SOM,SENS,.CPT,.ERR)
 Q:ERR'=0 0
 I X="" S ERR=ERRSTAN Q 0
 S @OP@(SOM,3)=X
 S NBDEC=NBDEC+DEC1
 Q 1
 
 
COAM() 
 S X=$$PREV^%DLCORCA(DF2,1,LOP,"",DL,@OP@(SOM,0),@OP@(SOM,2),SOM,SENS,.CPT,.ERR)
 Q:ERR'=0 0
 I X="" S ERR=ERRSTAN Q 0
 S @OP@(SOM,3)=X
 S NBDEC=NBDEC+DEC2
 Q 1
 
FPOSER Q ERR=0
 
 
ADDER(SOMMET,MESSAGE) 
 N NOER
 Q:MAP=0
 S NOER=$S($D(@LISRES):@LISRES+1,1:1)
 I PREMER S PREMER=0,@LISRES@(NOER)=$$RGAMME^%DLCON2_" "_COMPOSANT_" : "_$$^%QZCHW("decalage avec contraction"),@LISRES@(NOER+1)=$TR($J("",$L(@LISRES@(NOER)))," ","-"),NOER=NOER+2
 S @LISRES@(NOER)=SOMMET_" : "_MESSAGE
 S @LISRES=NOER
 Q
 ;

